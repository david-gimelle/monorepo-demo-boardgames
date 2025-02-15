variable "client_id" {
  description = "The client ID for the Azure service principal"
  type        = string
}

variable "client_secret" {
  description = "The client secret for the Azure service principal"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "react-aks-cluster"
}

variable "location" {
  description = "The Azure region to deploy the AKS cluster"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group for the AKS cluster"
  type        = string
}