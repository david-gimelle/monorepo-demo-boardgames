terraform {
  backend "gcs" {
    bucket  = "boardgames-tf-bucket"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = 1
  remove_default_node_pool = true
  min_master_version = "1.30.6-gke.1125000"
  release_channel {
    channel = "REGULAR"
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  network = "default"
  subnetwork = "default"

  ip_allocation_policy {
    use_ip_aliases = true
    cluster_secondary_range_name = "gke-boardgames-cluster-pods-6dc17bf7"
    services_secondary_range_name = "default"
  }

  master_authorized_networks_config {
    cidr_blocks = []
  }

  maintenance_policy {
    window {
      daily_maintenance_window {
        start_time = "03:00"
      }
    }
  }

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

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    shielded_instance_config {
      enable_secure_boot = true
    }
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    shielded_instance_config {
      enable_secure_boot = true
    }
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}