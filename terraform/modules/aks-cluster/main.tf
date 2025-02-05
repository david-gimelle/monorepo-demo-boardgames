resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix         = var.cluster_name
  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size            = var.vm_size
    os_disk_size_gb    = var.os_disk_size_gb
    enable_auto_scaling = var.enable_auto_scaling
    min_count          = var.min_count
    max_count          = var.max_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }

  auto_scaler_profile {
    scale_down_delay_after_add = "10m"
    scan_interval             = "10s"
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }

  tags = var.tags
}