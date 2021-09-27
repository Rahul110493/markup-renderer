resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_name
}

resource "google_project_iam_member" "service_account_permissions" {
  for_each =  toset(var.sa_permission_list)
  role     =  each.value
  member   = "serviceAccount:${google_service_account.service_account.email}"
}
