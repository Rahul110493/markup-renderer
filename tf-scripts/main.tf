terraform {
  required_providers {
    google = {
      source  = "hashicorp/google-beta"
      version = "3.70.0"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "default" {
  name     = "renderer"
  location = var.region

  template {
    spec {
      containers {
        image = var.docker_image
        ports {
          container_port = 80
        }
      }
      service_account_name = "cloudrun-identity@nodejsapp-314207.iam.gserviceaccount.com"  
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "serviceAccount:cloudrun-identity@nodejsapp-314207.iam.gserviceaccount.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
