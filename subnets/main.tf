locals {
  name = join("-", [var.name, var.environment])
}

resource "google_compute_network" "vpc" {
  name                    = join("-", [local.name, "vpc"])
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = join("-", [local.name, "subnet1"])
  ip_cidr_range = var.subnet1_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}
