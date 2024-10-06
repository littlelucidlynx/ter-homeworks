variable "env" {
  type    = string
  default = "develop"
}

variable "project" {
  type    = string
  default = "platform"
}

variable "service_web" {
  type    = string
  default = "web"
}

variable "service_db" {
  type    = string
  default = "db"
}

locals {
  vm_web_name = "netology-${var.env}-${var.project}-${var.service_web}"
  vm_db_name  = "netology-${var.env}-${var.project}-${var.service_db}"
}