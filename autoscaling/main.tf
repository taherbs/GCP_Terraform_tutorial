locals {
  template_name               = join("-", [var.name, "template"])
  health_check_name           = join("-", [var.name, "health-check"])
  instance_group_manager_name = join("-", [var.name, "instance-group-manager"])
  auto_scaler_name            = join("-", [var.name, "autoscaler"])
}

# Instance Template <- Describe Instance
resource "google_compute_instance_template" "instance_template" {
  name        = local.template_name
  description = "This is our autoscaling template"
  #tags = [] # network

  labels = {
    environment = var.environment
    name        = join("-", [var.name, "template"])
  }

  instance_description = "This is an instance that has been auto scaled"
  machine_type         = var.machine_type["${var.environment}"]
  can_ip_forward       = "false"

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  disk {
    auto_delete  = true
    disk_size_gb = 10
    mode         = "READ_WRITE"
    type         = "PERSISTENT"
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    scopes = var.service_account
  }
}

# Health Check <-- Auto Scaling Policy (when to scale )
resource "google_compute_health_check" "health" {
  name                = local.health_check_name
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10

  http_health_check {
    request_path = "/alive.jsp"
    port         = "8080"
  }
}

# Group Manager < -- Manages the nodes
resource "google_compute_region_instance_group_manager" "instance_group_manager" {
  name               = local.instance_group_manager_name
  base_instance_name = local.instance_group_manager_name
  region             = var.region
  version {
    instance_template = google_compute_instance_template.instance_template.id
  }
}

# Auto Scale Policy < -- How many instances
resource "google_compute_region_autoscaler" "autoscaler" {
  name   = local.auto_scaler_name
  region = var.region
  target = google_compute_region_instance_group_manager.instance_group_manager.id

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 60
    cpu_utilization {
      target = "0.8"
    }
  }
}
