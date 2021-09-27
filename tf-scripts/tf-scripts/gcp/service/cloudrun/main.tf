resource "google_cloud_run_service" "default" {
  name     = "${var.service_name}"
  location = "${var.region}"

  template {
    spec {
      containers {
        image = "${var.docker_image}"
        env {
          name = "${var.env_key}"
          value = "${var.env_value}"
        }
        ports {
          container_port = var.port
         }        
      }
      service_account_name = "${var.cloudrun_service_account}"
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "${var.invoker_member}"
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
