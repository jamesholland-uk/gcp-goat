resource google_sql_database_instance "master_instance" {
  name             = "terragoat-${var.environment}-master"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
}

resource google_bigquery_dataset "dataset" {
  dataset_id = "terragoat_${var.environment}_dataset"
  access {
    special_group = "allAuthenticatedUsers"
    role          = "READER"
  }
<<<<<<< HEAD
}
=======
  labels = {
    demo-owner           = "james"
    git_commit           = "1b1dc85dfc698e131bbee6dc5f90c89e453e54e6"
    git_file             = "big_data_tf"
    git_last_modified_at = "2021-08-03-20-30-26"
    git_last_modified_by = "jamoiholland"
    git_modifiers        = "jamoiholland"
    git_org              = "jamesholland-uk"
    git_repo             = "gcp-goat"
    level                = "production"
    pci-dss              = "true"
    team                 = "engineering"
    yor_trace            = "f4900b21-6412-4bc4-b2b8-e3f844e8e01a"
  }
}

resource google_sql_database_instance "master_instance1" {
  name             = "terragoat-${var.environment}-master1"
  database_version = "POSTGRES_11"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "WWW"
        value = "0.0.0.0/0"
      }
    }
    backup_configuration {
      enabled = false
    }
  }
  settings {
    ip_configuration {
      require_ssl = true
    }
  }
}
>>>>>>> d137decaa315b2b8f0864a14533fbc549811f227
