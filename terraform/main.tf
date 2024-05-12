terraform {
  required_providers {
    google = {
        source  = "hashicorp/google"
        version = "4.51.0"
    }
  }
}

provider "google" {
  project = "t-diagram-422507-k9"
  region  = "europe-west10-a"
}

resource "google_compute_instance" "server" {
  name         = "instance-20240509-084748"
  machine_type = "e2-medium"
  zone         = "europe-west10-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12-bookworm-v20240415"
    }
  }

  network_interface {
    network = "default"
    subnetwork = "default"

    access_config {
      nat_ip       = "34.32.26.88"
      network_tier = "PREMIUM"
    }
  }

  service_account {
    email  = "github-actions-deploy@t-diagram-422507-k9.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }


  tags = ["http-server", "https-server"]
}
