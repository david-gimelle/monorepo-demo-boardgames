variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
}

variable "initial_node_count" {
  description = "The initial number of nodes"
  type        = number
  default     = 1
}

variable "min_master_version" {
  description = "The minimum master version"
  type        = string
}

variable "release_channel" {
  description = "The release channel"
  type        = string
}

variable "vertical_pod_autoscaling_enabled" {
  description = "Enable vertical pod autoscaling"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "http_load_balancing_disabled" {
  description = "Disable HTTP load balancing"
  type        = bool
  default     = false
}

variable "horizontal_pod_autoscaling_disabled" {
  description = "Disable horizontal pod autoscaling"
  type        = bool
  default     = false
}

variable "network_policy_config_disabled" {
  description = "Disable network policy config"
  type        = bool
  default     = true
}

variable "dns_cache_config_enabled" {
  description = "Enable DNS cache config"
  type        = bool
  default     = true
}

variable "create_timeout" {
  description = "Create timeout"
  type        = string
  default     = "30m"
}

variable "update_timeout" {
  description = "Update timeout"
  type        = string
  default     = "30m"
}

variable "delete_timeout" {
  description = "Delete timeout"
  type        = string
  default     = "30m"
}

variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "preemptible" {
  description = "Whether the nodes are preemptible"
  type        = bool
  default     = true
}

variable "machine_type" {
  description = "The machine type of the nodes"
  type        = string
  default     = "e2-micro"
}

variable "disk_size_gb" {
  description = "The disk size of the nodes in GB"
  type        = number
  default     = 10
}

variable "oauth_scopes" {
  description = "The OAuth scopes for the nodes"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}

variable "metadata" {
  description = "The metadata for the nodes"
  type        = map(string)
  default     = {
    disable-legacy-endpoints = "true"
  }
}

variable "tags" {
  description = "The tags for the nodes"
  type        = list(string)
  default     = ["gke-node"]
}

variable "enable_secure_boot" {
  description = "Enable secure boot for the nodes"
  type        = bool
  default     = true
}

variable "auto_upgrade" {
  description = "Enable auto upgrade for the node pool"
  type        = bool
  default     = true
}

variable "auto_repair" {
  description = "Enable auto repair for the node pool"
  type        = bool
  default     = true
}

variable "min_node_count" {
  description = "The minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "The maximum number of nodes in the node pool"
  type        = number
  default     = 3
}

variable "node_pool_create_timeout" {
  description = "Create timeout for the node pool"
  type        = string
  default     = "30m"
}

variable "node_pool_update_timeout" {
  description = "Update timeout for the node pool"
  type        = string
  default     = "30m"
}

variable "node_pool_delete_timeout" {
  description = "Delete timeout for the node pool"
  type        = string
  default     = "30m"
}