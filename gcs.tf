resource "google_storage_bucket" "terragoat_website" {
  name                        = "terragot-${var.environment}"
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    demo-owner           = "james"
    git_commit           = "be0c828d1b6d2ed963adf39c525bbe00fca735ba"
    git_file             = "gcs_tf"
    git_last_modified_at = "2021-08-05-15-38-13"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "44b430e0-0617-4db1-92be-521489b07c73"
  }
}


resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}