resource "google_compute_instance" "test_instance" {
  count          = length(var.machine_names)
  name           = var.machine_names["${count.index}"]
  machine_type   = var.machine_type["${var.environment}"]
  zone           = var.zone
  can_ip_forward = "false"
  description    = "This is our Virtual Machine"

  tags = ["allow-http", "allow-https", "allow-ssh"] # FIREWALL

  boot_disk {
    initialize_params {
      image = var.image
      size  = "10"
    }
  }

  # Key value pair for identification
  labels = {
    name         = var.machine_names["${count.index}"]
    machine_type = var.environment
  }

  network_interface {
    network = "default"
  }

  # Metadata key/value pairs to make available from within the instance
  metadata = {
    size = "20"
    foo  = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt" #An alternative to using the startup-script

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}

resource "google_compute_disk" "test_instance_disk2" {
  name = "test-desk"
  type = "pd-ssd"
  zone = var.zone
  size = "10"
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.test_instance_disk2.self_link
  instance = google_compute_instance.test_instance[0].self_link
}
