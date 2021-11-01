resource "google_service_account" "service_account" {
  project = "nodejsapp-324007"
  account_id   = var.service_account_id
  display_name = var.service_account_name
}
