resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix         = var.cluster_name
  kubernetes_version = var.kubernetes_version

  role_based_access_control_enabled = true
  private_cluster_enabled         = false

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size            = var.vm_size
    os_disk_size_gb    = var.os_disk_size_gb
    enable_auto_scaling = var.enable_auto_scaling
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }

  tags = var.tags
}