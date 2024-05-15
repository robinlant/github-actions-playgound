resource "google_compute_address" "main"{
    name = "counter"
    network_tier = "PREMIUM"
}

resource "google_compute_instance" "main"{
    name = "main-server"
    machine_type = "e2-medium"
    zone = var.zone

    boot_disk {
        initialize_params {
          image = "debian-cloud/debian-11"
        }
    }

    network_interface {
      network = "default"

      access_config {
        nat_ip = google_compute_address.main.address
      }
    }

    tags = ["http-server", "https-server"]

    metadata = {
      ssh-keys = var.ssh-key
    }

    metadata_startup_script = <<-EOF
      #!/bin/bash
      sudo apt-get update
      sudo apt-get install -y docker.io
      sudo systemctl start docker
      sudo systemctl enable docker
      sudo getent group docker || sudo groupadd docker
      sudo usermod -aG docker $USER
    EOF
}
