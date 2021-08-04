resource "google_storage_bucket" "terragoat_website" {
  name                        = "terragot-${var.environment}"
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    demo-owner           = "james"
    git_commit           = "a89a5c6aa6e7486c79c1f52355bbd93b4fb9790b"
    git_file             = "gcs_tf"
    git_last_modified_at = "2021-08-04-12-25-30"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "d1a7244f-3477-4dba-a25b-4a8ac0cbddcc"
  }
}


resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}