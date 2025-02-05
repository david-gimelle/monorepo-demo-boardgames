variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The Azure region where the cluster will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use"
  type        = string
  default     = "1.26"
}

variable "node_count" {
  description = "The initial number of nodes"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_B2s"
}

variable "os_disk_size_gb" {
  description = "The size of the OS disk in GB"
  type        = number
  default     = 30
}

variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = true
}

variable "min_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 3
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "create_timeout" {
  description = "Timeout for creating the cluster"
  type        = string
  default     = "30m"
}

variable "update_timeout" {
  description = "Timeout for updating the cluster"
  type        = string
  default     = "30m"
}

variable "delete_timeout" {
  description = "Timeout for deleting the cluster"
  type        = string
  default     = "30m"
}