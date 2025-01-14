resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  initial_node_count = var.initial_node_count
  release_channel {
    channel = var.release_channel
  }

  vertical_pod_autoscaling {
    enabled = var.vertical_pod_autoscaling_enabled
  }

  deletion_protection = var.deletion_protection

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing_disabled
    }
    horizontal_pod_autoscaling {
      disabled = var.horizontal_pod_autoscaling_disabled
    }
    network_policy_config {
      disabled = var.network_policy_config_disabled
    }
    dns_cache_config {
      enabled = var.dns_cache_config_enabled
    }
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = var.node_count

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    oauth_scopes = var.oauth_scopes
    metadata = var.metadata
    tags = var.tags
    shielded_instance_config {
      enable_secure_boot = var.enable_secure_boot
    }
  }

  management {
    auto_upgrade = var.auto_upgrade
    auto_repair  = var.auto_repair
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  timeouts {
    create = var.node_pool_create_timeout
    update = var.node_pool_update_timeout
    delete = var.node_pool_delete_timeout
  }
}