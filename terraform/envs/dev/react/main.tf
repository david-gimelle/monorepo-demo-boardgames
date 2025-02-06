terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "boardgamestfstate"
    container_name      = "tfstate"
    key                 = "terraform/react/state/test"
  }
}

provider "azurerm" {
  features {}
}

module "react_cluster" {
  source = "../../../modules/aks-cluster"

  cluster_name           = var.cluster_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  kubernetes_version    = "1.26"
  
  # Node pool configuration
  node_count            = 1
  vm_size              = "Standard_B2s"
  os_disk_size_gb      = 30
  enable_auto_scaling  = true
  min_count           = 1
  max_count           = 3

  # Timeouts
  create_timeout      = "30m"
  update_timeout      = "30m"
  delete_timeout      = "30m"

  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}