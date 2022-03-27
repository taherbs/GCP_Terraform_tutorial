locals {
  name = join("-", [var.name, var.environment])
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = local.name
  region                     = var.region
  zones                      = var.zones
  network                    = "default"
  subnetwork                 = "default"
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = var.machine_type["${var.environment}"]
      min_count          = 1
      max_count          = 2 # quota errors if the number is too high
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = "true"
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  #  node_pools_taints = {
  #    all = []
  #
  #    default-node-pool = [
  #      {
  #        key    = "default-node-pool"
  #        value  = "true"
  #        effect = "PREFER_NO_SCHEDULE"
  #      },
  #    ]
  #  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
