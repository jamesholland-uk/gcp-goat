resource "google_storage_bucket" "terragoat_website" {
  name                        = "terragot-${var.environment}"
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    demo-owner           = "james"
    git_commit           = "c4f3c2a350234732386b2df93c80c6e4b77311df"
    git_file             = "gcs_tf"
    git_last_modified_at = "2021-08-04-15-15-38"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "92a7bf49-cda6-463d-8814-fa90e37b6b3d"
  }
}


resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}