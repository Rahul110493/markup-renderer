variable "name" {
  description = "The name of cluster"
  type        = string
  default     = ""
}

variable "ali_region" {
  description = "The name of ali_region where cluster created"
  type        = string
  default     = ""
}

variable "password" {
  description = "The password for node pools"
  type        = string
  default     = ""
}
