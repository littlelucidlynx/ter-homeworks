##yandex cloud provider vars
/*
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}
*/

variable "cloud_id" {
  type        = string
  default     = "b1g393ugq43uqc1r3n8a"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1guvvhgbqd0n8591q7k"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

##ssh

variable "vms_ssh_root_key" {
  type        = string
  default     = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICBJOodclPNPYPA2pyGpmraEW7K7qzSFNOw7SFk9JxUq"
  description = "ssh-keygen -t ed25519"
}

###hardcode vars

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2204-lts"
  description = "Image family name"
}

variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
  description = "Instance name"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
  description = "Instance platform ID"
}

variable "vm_web_cores" {
  type    = string
  default = "2"
  description = "vCPU Cores"
}

variable "vm_web_memory" {
  type    = string
  default = "1"
  description = "Memory size"
}

variable "vm_web_core_fraction" {
  type    = string
  default = "20"
  description = "vCPU Core fraction"
}

variable "vm_web_nat" {
  type    = bool
  default = true
  description = "NAT use"
}

variable "vm_web_serial_port_enable" {
  type    = bool
  default = true
  description = "Serial console port use"
}

variable "vm_web_preemptible" {
  type    = bool
  default = true
  description = "Preemptible use"
}