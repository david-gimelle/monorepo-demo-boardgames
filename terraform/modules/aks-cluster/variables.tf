variable "cluster_name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "The Azure location where the cluster will be created"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "kubernetes_version" {
  type        = string
  description = "The version of Kubernetes"
  default     = "1.26"
}

variable "node_count" {
  type        = number
  description = "The initial number of nodes"
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "The size of the VMs"
  default     = "Standard_D2s_v3"
}

variable "os_disk_size_gb" {
  type        = number
  description = "The OS disk size in GB"
  default     = 30
}

variable "enable_auto_scaling" {
  type        = bool
  description = "Enable node pool autoscaling"
  default     = true
}

variable "min_count" {
  type        = number
  description = "Minimum number of nodes"
  default     = 1
}

variable "max_count" {
  type        = number
  description = "Maximum number of nodes"
  default     = 3
}

variable "create_timeout" {
  type        = string
  description = "Timeout for creating the cluster"
  default     = "30m"
}

variable "update_timeout" {
  type        = string
  description = "Timeout for updating the cluster"
  default     = "30m"
}

variable "delete_timeout" {
  type        = string
  description = "Timeout for deleting the cluster"
  default     = "30m"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}