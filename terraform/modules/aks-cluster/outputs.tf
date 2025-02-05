output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.main.name
}

output "kubernetes_cluster_endpoint" {
  value = azurerm_kubernetes_cluster.main.kube_config.0.host
}

output "kubernetes_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive = true
}

output "resource_group_name" {
  value = azurerm_kubernetes_cluster.main.resource_group_name
}