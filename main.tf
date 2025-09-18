

provider "null" {}

resource "null_resource" "hello_world" {
  triggers = {
    requirements_sha1 = filesha1("${path.module}/requirements.txt")
  }
  provisioner "local-exec" {
    command = <<EOT
      python3 -m pip install -r requirements.txt
    EOT
  }
}

/*

resource "google_project" "my_project" {
  name            = "My Application Project"
  project_id      = "bts-app-prod-${random_id.project_suffix.hex}"
  folder_id       = "folders/678542401727"
  billing_account = "0122AB-162FF8-990BC9"
  
  # Prevent accidental deletion
  lifecycle {
    prevent_destroy = false
  }
  
  labels = {
    environment = "dev"
    team        = "platform"
    cost_center = "engineering"
  }
}

# Random suffix to ensure unique project IDs
resource "random_id" "project_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "terraform_state" {
  name          = "tf-runner-dev-buckket"
  location      = "us-central1"
  project       = "bcg-demotoo-prj-0188"
  storage_class = "STANDARD"

  # Prevent accidental deletion of the bucket
  lifecycle {
    prevent_destroy = false
  }

  # Enable versioning for state file history
  versioning {
    enabled = true
  }

  # Enable uniform bucket-level access for better security
  uniform_bucket_level_access = true


  # Lifecycle management to clean up old versions
  lifecycle_rule {
    condition {
      age = 30
      with_state = "ARCHIVED"
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      num_newer_versions = 10
    }
    action {
      type = "Delete"
    }
  }

  # Labels for organization and cost tracking
  labels = {
    purpose     = "terraform-state"
    managed_by  = "terraform"
  }
}
*/
