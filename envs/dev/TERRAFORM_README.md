# GCP provisionning and Terraform settings
Almost all is done by terraform but a few things has been anyway manually set

# Manually set
- gcs bucket to store terraform state files
- fire wall rule to give access to github to any GKE cluster with the rule allow_ghcr_io for any cluster with the tag gke-node