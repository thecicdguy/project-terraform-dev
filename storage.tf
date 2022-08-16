resource "google_storage_bucket" "shyam-storage" {
  name          = "shyam-storage-bucket"
  project = var.project_id
  location      = var.region_id
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_acl" "shyam_storage_acl" {
  bucket = google_storage_bucket.shyam-storage.name

  role_entity = [
    "OWNER:user-shyamgcp22@gmail.com",
    "WRITER:user-storage-writer@${var.project_id}.iam.gserviceaccount.com",
  ]
}