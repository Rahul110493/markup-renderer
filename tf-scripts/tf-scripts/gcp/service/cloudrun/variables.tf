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

variable "env_key" {
  description = "env_key for cloud run Application."
  type =string
  default = ""
}
variable "env_value" {
  description = "env_value for cloud run Application."
  type =string
  default = ""
}

variable "port" {
  description = "port for Application."
  type =string
  default = 80
}
