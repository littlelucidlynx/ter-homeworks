###cloud vars

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


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICBJOodclPNPYPA2pyGpmraEW7K7qzSFNOw7SFk9JxUq"
  description = "ssh-keygen -t ed25519"
}