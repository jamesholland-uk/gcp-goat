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
    demo-owner           = "james"
    git_commit           = "1b1dc85dfc698e131bbee6dc5f90c89e453e54e6"
    git_file             = "instances_tf"
    git_last_modified_at = "2021-08-03-20-30-26"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "bfa3bba1-372b-4fcf-9149-0fb2db792420"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    demo-owner           = "james"
    git_commit           = "1b1dc85dfc698e131bbee6dc5f90c89e453e54e6"
    git_file             = "instances_tf"
    git_last_modified_at = "2021-08-03-20-30-26"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "480068e3-a979-4d8a-bfe0-6ed2382a9508"
  }
}