variable "cluster_name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes to use"
}

variable "node_count" {
  type        = number
  default     = 1
  description = "Number of nodes in the default node pool"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "Size of the VM to use for nodes"
}

variable "os_disk_size_gb" {
  type        = number
  default     = 30
  description = "Size of the OS disk in GB"
}

variable "enable_auto_scaling" {
  type        = bool
  default     = false
  description = "Enable node pool autoscaling"
}

variable "create_timeout" {
  type        = string
  default     = "30m"
  description = "Timeout for creating the cluster"
}

variable "update_timeout" {
  type        = string
  default     = "30m"
  description = "Timeout for updating the cluster"
}

variable "delete_timeout" {
  type        = string
  default     = "30m"
  description = "Timeout for deleting the cluster"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources"
}