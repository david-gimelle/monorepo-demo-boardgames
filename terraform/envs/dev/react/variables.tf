variable "subscription_id" {
  description = "The subscription ID to deploy the AKS cluster"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the AKS cluster"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group for AKS cluster"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "react-aks-cluster"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use for AKS cluster"
  type        = string
  default     = "1.26"
}

variable "tags" {
  description = "A mapping of tags to assign to the AKS cluster"
  type        = map(string)
  default     = {}
}