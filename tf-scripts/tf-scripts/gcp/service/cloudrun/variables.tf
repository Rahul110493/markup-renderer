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

variable "env_list" {
  type = "map"
  default = {
    "account1" = "accountA"
    "account2" = "accountB"
  }
}

variable "port" {
  description = "port for Application."
  type =string
  default = 80
}
