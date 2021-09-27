terraform {
  required_providers {
    google = {
      source = "hashicorp/google-beta"
      version = "3.70.0"
    }
  }
}
provider "google" {
  project = "${var.project_id}"
  region  = "${var.region}"
  zone = "${var.zone}"
}
provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.ali_region
}

module "enable-api" {
  count = var.vendor == "gcp" ? 1 : 0
  source= "./tf-scripts/gcp/service/api-resources"
  gcp_service_list=var.gcp_service_list
}
  
module "service-account" {
  count = var.vendor == "gcp" ? 1 : 0
  source= "./tf-scripts/gcp/service/service-account"
  service_account_id= var.service_account_id
  service_account_name= var.service_account_name
  sa_permission_list=var.sa_permission_list
}
  
module "gcp-cloudrun" {
    count = var.vendor == "gcp" && var.vendor_service == "cloudrun" ? 1 : 0
    source = "./tf-scripts/gcp/service/cloudrun"
    
    project_id = var.project_id
    region = var.region
    docker_image = var.docker_image
    cloudrun_service_account = var.cloudrun_service_account
    service_name = var.service_name
    invoker_member = var.invoker_member
    port = var.port
    env_key = var.env_key
    env_value = var.env_value
    depends_on = [module.enable-api, module.service-account]
  
}

module "gcp-gke" {
    count = var.vendor == "gcp" && var.vendor_service == "gke" ? 1 : 0
    source = "./tf-scripts/gcp/service/gke"

    project_id = var.project_id
    region = var.region
    zone = var.zone
    cls_name = var.cls_name
    cls_location_id = var.cls_location_id
    remove_default_node_pool = var.remove_default_node_pool
    initial_node_count = var.initial_node_count
    container_node_pool_name = var.container_node_pool_name
    container_node_pool_name_location_id = var.container_node_pool_name_location_id
    node_count = var.node_count
    preemptible = var.preemptible
    machine_type = var.machine_type
    
  
}

  module "gcp-cloudfunctions" {
  count = var.vendor == "gcp" && var.vendor_service == "cloudfunctions" ? 1 : 0
  source = "./tf-scripts/gcp/service/cloudfunctions"
        
  function_name         = var.function_name    
  description           = var.description != "" ? var.description : "${var.name} HTTP Cloud Function"
  available_memory_mb   = var.available_memory_mb
  bucket_name           = var.bucket_name
  timeout               = var.timeout
  entry_point           = var.entry_point
  runtime               = var.runtime
  environment_variables = var.environment_variables
  service_account_email = var.service_account_email
  vpc_connector         = var.vpc_connector
  max_instances         = var.max_instances
}
    
module "alicloud-ack" {
    count = var.vendor == "alicloud" && var.vendor_service == "ack" ? 1 : 0
    source = "./tf-scripts/alicloud/service/ack"

    name = var.name
#   region = var.ali_region
    password = var.password
  
}
