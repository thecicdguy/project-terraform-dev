resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region_id
  project       = var.project_id
  repository_id = var.repository_id
  description   = "flexion docker repository"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "member" {
  project    = var.project_id
  location   = var.region_id
  repository = var.repository_id
  role       = "roles/artifactregistry.admin"
  member     = "serviceAccount:artifact-registry-upload@${var.project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.upload_container]
}

resource "google_artifact_registry_repository_iam_member" "registry_reader" {
  project    = var.project_id
  location   = var.region_id
  repository = var.repository_id
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:cloud-run-deployer@${var.project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.container_deployer]
}
