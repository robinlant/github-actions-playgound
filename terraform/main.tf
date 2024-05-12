terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.51.0"
    }
  }
}

provider "google" {
  project = "t-diagram-422507-k9"
  region = "europe-west10-an"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}