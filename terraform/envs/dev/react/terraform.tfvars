# Azure authentication variables
client_id       = "your-client-id"
client_secret   = "your-client-secret"
tenant_id       = "your-tenant-id"
subscription_id = "your-subscription-id"

# AKS cluster variables
cluster_name         = "react-aks-cluster"
location            = "westeurope"
resource_group_name = "your-resource-group"
kubernetes_version  = "1.26"
vm_size            = "Standard_D2s_v3"
node_count         = 1
enable_auto_scaling = true
min_count          = 1
max_count          = 3
os_disk_size_gb    = 30

tags = {
  Environment = "Development"
  Project     = "React App"
}