terraform {
  backend "gcs" {
    bucket  = "boardgames-tf-bucket"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  version = ">= 3.75.0"  // Specify the required provider version
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  autopilot {
    enabled = true
  }

  min_master_version = "1.30.6-gke.1125000"
  release_channel {
    channel = "REGULAR"
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  deletion_protection = false

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
    network_policy_config {
      disabled = true
    }
    dns_cache_config {
      enabled = true
    }
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}