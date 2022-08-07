/*# A host project provides network resources to associated service projects.
resource "google_compute_shared_vpc_host_project" "vpc_host" {
  project = "vpc-host"
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "flexion" {
  host_project    = google_compute_shared_vpc_host_project.vpc_host.project
  service_project = "flexion"
} */

module "project-services" {
  source                      = "terraform-google-modules/project-factory/google//modules/project_services"
  version                     = "~> 13.0"
  project_id                  = var.project_id
  enable_apis                 = true
  disable_services_on_destroy = true

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "iam.googleapis.com",
    "binaryauthorization.googleapis.com",
  ]
}