resource "google_storage_bucket" "terragoat_website" {
  name                        = "terragot-${var.environment}"
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    demo-owner = "james"
    level      = "development"
    pci-dss    = "true"
    team       = "engineering"
    yor_trace  = "8bf62c34-871d-423a-8554-8c75fe03cdbb"
  }
}


resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}