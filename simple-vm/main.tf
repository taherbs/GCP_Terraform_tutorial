resource "google_compute_instance" "test_instance" {
  count        = length(var.machine_names)
  name         = var.machine_names["${count.index}"]
  machine_type = var.machine_type[var.environment]
  zone         = var.zone

  tags = [var.machine_names["${count.index}"]]

  boot_disk {
    initialize_params {
      image = var.os
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # restict access to resources form the instance
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
