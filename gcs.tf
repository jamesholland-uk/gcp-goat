resource "google_storage_bucket" "terragoat_website" {
  name                        = "terragot-${var.environment}"
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    demo-owner           = "james"
    git_commit           = "0cf0ab9599b3186eec21b56144c953055e7afafc"
    git_file             = "gcs_tf"
    git_last_modified_at = "2021-08-04-15-04-31"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "60bf8507-5a08-4014-aae6-af473e7efc62"
  }
}


resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}