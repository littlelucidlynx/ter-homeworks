##yandex cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
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
  description = "VPC network&subnet name"
}

###common vars
#zone a
variable "subnet_a_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

#zone b
variable "subnet_b_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


#subnet a cidr
variable "subnet_a_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

#subnet b cidr
variable "subnet_b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


##marketing-vm variables
variable "marketing_vm_env" {
  type        = string
  default     = "develop"
}

variable "marketing_vm_instance_name" {
  type        = string
  default     = "marketing-web"
}

variable "marketing_vm_instance_count" {
  type        = number
  default     = 1
}

variable "marketing_vm_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "marketing_vm_public_ip" {
  type        = bool
  default     = true
}

variable "marketing_vm_serial_port_enable" {
  type        = bool
  default     = true
}

variable "marketing_vm_labels" {
  type = map
  default = {
    "owner"     = "littlelucidlynx"
    "project"   = "marketing"
    }
}

#analytics-vm variables
variable "analytics_vm_env" {
  type        = string
  default     = "stage"
}

variable "analytics_vm_instance_name" {
  type        = string
  default     = "analytics-web"
}

variable "analytics_vm_instance_count" {
  type        = number
  default     = 1
}

variable "analytics_vm_image_family" {
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "analytics_vm_public_ip" {
  type        = bool
  default     = true
}

variable "analytics_vm_serial_port_enable" {
  type        = bool
  default     = true
}

variable "analytics_vm_labels" {
  type = map
  default = {
    "owner"     = "littlelucidlynx"
    "project"   = "analytics"
    }
}

#variable "marketing_vm_resources" {
#   type = map(object({
#    source              = string
#    env                 = string
#    instance_name       = string
#    instance_count      = number
#    image_family        = string
#    public_ip           = bool
#    label_owner         = string
#    label_project       = string
#    serial_port_enable  = any
#  }))
#  default = {
#     source              = "git::https://github.com/littlelucidlynx/yandex_compute_instance.git?ref=main"
#      env                 = "develop"
#      instance_name       = "marketing-web"
#      instance_count      = 1,
#      image_family        = "ubuntu-2204-lts"
#      public_ip           = true
#      label_owner         = "littlelucidlynx"
#      label_project       = "marketing"
#      serial_port_enable  = 1
#          }
#            }

#Имя пользователя в виртуальной машине вместо стандартного
variable "vm_username" {
  type        = string
  default     = "eurus-cloud"
  description = "Username for vm in Cloud init"
}

#Путь к публичному ключу для подключения к yandex cloud
variable "yc_ssh_key_path" {
  description = "Путь к открытому ключу SSH для подключения к облаку"
  type        = string
  default     = "~/.authorized_key.json"
}

#Путь к публичному ключу для передачи в виртуальную машину
variable vms_ssh_key_path {
  type    = string
  default = "~/.ssh/service-cloud-ssh.pub"
}

#Список пакетов для установки через Cloud init
variable packages {
  type    = list
  default = ["vim", "nginx", "mc"]
}