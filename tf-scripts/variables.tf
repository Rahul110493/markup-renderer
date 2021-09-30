variable "project_id" {
  description = "The ID of an Google Project "
  type =string
  default = ""
}
variable "region" {
  description = "Region"
  type = string
  default = ""
}
variable "ali_region" {
  description = "Ali Region"
  type = string
  default = ""
}
variable "zone" {
  description = "zone"
  type = string
  default = ""
}
variable "cls_name" {
  description = "Name of the cluster"
  type = string
  default = ""
}
variable "cls_location_id" {
  description = "Location of cluster"
  type = string
  default = ""
}

variable "initial_node_count" {
  description = "The domain associated with the GCP Organization ID"
  type = number
  default = 1
}
variable "remove_default_node_pool" {
  description = "remove default node pool if anything exist"
  type = bool
  default = true
}
variable "container_node_pool_name" {
  description = "Name of the conatiner node pool name"
  type = string
  default = ""
}
variable "container_node_pool_name_location_id" {
  description = "In Which region you want to create container nod pool "
  type =string
  default = ""
}

variable "node_count" {
  description = "Number of nodes to create"
  type =number
  default = 1
}
variable "machine_type" {
  description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine."
  type =string
  default = ""
}
variable "preemptible" {
  description = "preemtibable"
  type =bool
  default =true
}

variable "docker_image" {
  description = "DockerFile for Application."
  type =string
  default = ""
}

variable "cloudrun_service_account" {
  description = "cloudrun service account for Application."
  type =string
  default = ""
}

variable "service_name" {
  description = "service_name for cloud run Application."
  type =string
  default = ""
}

variable "invoker_member" {
  description = "invoker member for cloud run Application."
  type =string
  default = ""
}

variable "port" {
  description = "port for Application."
  type =string
  default = 80
}
variable "name" {
  description = "The name of cluster"
  type        = string
  default     = ""
}

variable "password" {
  description = "The password for node pools"
  type        = string
  default     = ""
}

variable "vendor" {
  description = "Cloud vendor"
  type        = string
  default     = ""
}

variable "vendor_service" {
  description = "vendor_service for cloud"
  type        = string
  default     = ""
}

variable "env_key" {
  description = "env_key for cloud"
  type        = string
  default     = "dummy"
}

variable "env_value" {
  description = "env_value for cloud"
  type        = string
  default     = "dummy"
}

variable "access_key" {
  description = "access_key for ali cloud"
  type        = string
  default     = "dummy"
}
variable "secret_key" {
  description = "secret_key for ali cloud"
  type        = string
  default     = "dummy"
}
## REQUIRED VARIABLES
variable "bucket_name" {
  type        = string
  description = "Name of GCS bucket to use to store the Cloud Functions their contents on."
  default     = ""
}

variable "function_name" {
  type        = string
  description = "A user-defined name of the function. Function names must be unique globally."
  default     = "cloudfunction"
}

## OPTIONAL VARIABLES

variable "source_dir" {
  type        = string
  description = "Source directory containing the function source files. Its contents will be zipped and uploaded to the given `bucket_name`"
  default     = "" # "./cloudfunctions/${var.name}"
}

variable "description" {
  type        = string
  description = "(Optional) Description of the function."
  default     = "" # ${var.name} HTTP Cloud Function"
}

variable "runtime" {
  type        = string
  description = "(Optional) The runtime in which the function is going to run. One of `nodejs6`, `nodejs8`, `nodejs10`, `python37`, `go111`. Default value is `python37`."
  default     = "nodejs14"
}

variable "entry_point" {
  type        = string
  description = "(Optional) Name of the function that will be executed when the Google Cloud Function is triggered. Default value is `__main__`"
  default     = "__main__"
}

variable "available_memory_mb" {
  type        = number
  description = "(Optional) Memory (in MB), available to the function. Default value is 128. Allowed values are: 128, 256, 512, 1024, and 2048."
  default     = 256
}

variable "timeout" {
  type        = number
  description = "(Optional) Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds."
  default     = 540
}

variable "environment_variables" {
  type        = map
  description = "(Optional) A set of key/value environment variable pairs to assign to the function."
  default     = {}
}

variable "service_account_email" {
  type        = string
  description = "(Optional) If provided, the self-provided service account to run the function with."
  default     = ""
}

variable "vpc_connector" {
  type        = string
  description = "(Optional) If provided, the vpc connector to use"
  default     = null
}

variable "max_instances" {
  type        = number
  description = "(Optional) Limit the degree to which your function will scale in response to incoming requests."
  default     = null
}
variable "service_account_id" {
  description = "The service_account_id of an Google Project"
  type = string
  default = ""
}

variable "service_account_name" {
  description = "The service_account_name of an Google Project"
  type = string
  default = ""
}
variable "gcp_service_list" {
  description = "The service_account_name of an Google Project"
  type = list
  default =  [
   "iam.googleapis.com",                     # Identity and Access Management (IAM) API
 ]
}

variable sa_permission_list {
  description = "The service_account_permissions of an Google Project"
  type = list
  default =  [
    "roles/cloudkms.cryptoKeyDecrypter",                
    "roles/secretmanager.secretAccessor",
    "roles/secretmanager.secretVersionManager",
    "roles/viewer"                   
 ]  
}
