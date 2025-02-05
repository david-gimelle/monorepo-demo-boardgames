terraform {
  backend "gcs" {
    bucket  = "boardgames-tf-bucket"
    prefix  = "terraform/python/state/test"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "python_cluster" {
  source = "../../../modules/gke-cluster"

  cluster_name                      = var.cluster_name
  zone                              = var.zone
  initial_node_count                = 1
  release_channel                   = "REGULAR"
  vertical_pod_autoscaling_enabled  = true
  deletion_protection               = false
  http_load_balancing_disabled      = false
  horizontal_pod_autoscaling_disabled = false
  network_policy_config_disabled    = true
  dns_cache_config_enabled          = true
  create_timeout                    = "30m"
  update_timeout                    = "30m"
  delete_timeout                    = "30m"
  node_count                        = 1
  preemptible                       = true
  machine_type                      = "e2-micro"
  disk_size_gb                      = 10
  oauth_scopes                      = ["https://www.googleapis.com/auth/cloud-platform"]
  metadata                          = {
    disable-legacy-endpoints = "true"
  }
  tags                              = ["gke-node"]
  enable_secure_boot                = true
  auto_upgrade                      = true
  auto_repair                       = true
  min_node_count                    = 1
  max_node_count                    = 3
  node_pool_create_timeout          = "30m"
  node_pool_update_timeout          = "30m"
  node_pool_delete_timeout          = "30m"
}


