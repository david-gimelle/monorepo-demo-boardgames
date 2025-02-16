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

resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix         = var.cluster_name
  kubernetes_version = "1.26"

  // Add explicit configurations for newer SDK
  role_based_access_control_enabled = true
  public_network_access_enabled    = true
  private_cluster_enabled         = false

  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size            = "Standard_B2s"
    os_disk_size_gb    = 30
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}