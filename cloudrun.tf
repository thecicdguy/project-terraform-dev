resource "google_cloud_run_service" "flexion_service" {
  name     = var.service_name
  location = var.region_id

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/${var.project_id}/flexion-repository/hello-srv:dev"
        ports {
          container_port = 5000
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  depends_on = [google_artifact_registry_repository.my-repo]
}

resource "google_cloud_run_service_iam_member" "run_allow_unauthenticated" {
  provider = google-beta
  project  = var.project_id
  location = var.region_id
  service  = var.service_name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "cloud_run_deployer" {
  provider = google
  project  = var.project_id
  location = var.region_id
  service  = var.service_name
  role     = "roles/run.developer"
  member   = "serviceAccount:cloud-run-deployer@${var.project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.container_deployer]
}