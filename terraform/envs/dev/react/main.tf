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
  node_count            = 1
  vm_size              = "Standard_B2s"
  
  default_node_pool = {
    name                = "default"
    enable_auto_scaling = true
    min_count          = 1
    max_count          = 3
    os_disk_size_gb    = 30
  }

  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}