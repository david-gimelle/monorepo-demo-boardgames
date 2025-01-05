variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region to deploy the GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "my-gke-cluster"
}

variable "gcs_bucket_name" {
  description = "The name of the GCS bucket to store the Terraform state"
  type        = string
}