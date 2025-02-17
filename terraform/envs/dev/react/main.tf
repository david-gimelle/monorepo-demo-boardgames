terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "momorepo1"
    storage_account_name = "monorepoterraform"
    container_name      = "tfstate2"
    key                 = "terraform/react/state/dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

module "aks_cluster" {
  source = "../../../modules/aks-cluster"

  cluster_name         = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version  = "1.29.13"
  
  node_count          = 1
  vm_size            = "Standard_B2s"
  os_disk_size_gb    = 30
  enable_auto_scaling = false
  
  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}