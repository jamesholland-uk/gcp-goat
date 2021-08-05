data google_compute_zones "zones" {}

resource google_compute_instance "server" {
  machine_type = "n1-standard-1"
  name         = "terragoat-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    demo-owner = "james"
    level      = "development"
    pci-dss    = "true"
    team       = "engineering"
    yor_trace  = "91d2478d-1555-45d3-87e3-5c6455c82e0a"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    demo-owner = "james"
    level      = "development"
    pci-dss    = "true"
    team       = "engineering"
    yor_trace  = "a62d0b1d-e3db-44a0-8394-3c48fb363697"
  }
}