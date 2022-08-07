variable "project_id" {
  description = "The ID of the project where resource will be created"
  default     = "flexion-dev"
  type        = string
}

variable "region_id" {
  description = "GCP region"
  default     = "us-central1"
  type        = string
}

variable "zone_id" {
  description = "GCP zone"
  default     = "us-central1-c"
  type        = string
}

variable "service_name" {
  description = "Name of service deployed to Cloud Run"
  default     = "flexion-srv-dev"
  type        = string
}

variable "repository_id" {
  description = "Name of artifact repository in Artifact Regisrty"
  default     = "flexion-repository"
  type        = string
}