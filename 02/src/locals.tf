variable "env" {
  type    = string
  default = "develop"
}

variable "project" {
  type    = string
  default = "platform"
}

variable "role_web" {
  type    = string
  default = "web"
}

variable "role_db" {
  type    = string
  default = "db"
}

locals {
  vm_web_name = "netology-${var.env}-${var.project}-${var.role_web}"
  vm_db_name  = "netology-${var.env}-${var.project}-${var.role_db}"
}