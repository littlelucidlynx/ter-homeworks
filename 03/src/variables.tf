##yandex cloud provider vars

#cloud variables
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

variable "vm_platform_id" {
  type    = string
  default = "standard-v3"
  description = "Instance platform ID"
}

### Basic variables

variable "vm_image_family" {
  type    = string
  default = "ubuntu-2204-lts"
  description = "Image family name"
}

variable "ssh_key_path" {
  description = "Путь к открытому ключу SSH для подключения к облаку"
  type        = string
  default     = "~/.authorized_key.json"
}

variable "serial-port-enable" {
  default     = 1
}

##

#web (count-vm) variables
variable "vm_web_count" {
  type        = number
  default     = 2
}

variable "vm_web_prefix_name" {
  type        = string
  default     = "web"
}


variable "web_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    preemptible   = bool
    nat           = bool
    default_zone  = string   
    platform_id   = string
    image_family  = string
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true      
      default_zone  = "ru-central1-a"
      platform_id   = "standard-v3"
      image_family  = "ubuntu-2204-lts"
          }
            }
  }

##

#db (for_each-vm) variables
variable "db_resources" {
  description = "For Each VM resources"
  type = list(object(
    {
    name          = string
    hostname      = string
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    preemptible   = bool
    nat           = bool
    default_zone  = string   
    platform_id   = string
    image_family  = string
    }
  ))
  default = [
    {
      name          = "main"
      hostname      = "main"
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 20
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true      
      default_zone  = "ru-central1-a"
      platform_id   = "standard-v3"
      image_family  = "ubuntu-2204-lts"
    },
    {
      name          = "replica"
      hostname      = "replica"
      cores         = 2
      memory        = 1
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true      
      default_zone  = "ru-central1-a"
      platform_id   = "standard-v3"
      image_family  = "ubuntu-2204-lts"
    }
  ]
}


#disk variables

variable "disk_count" {
  type            = number
  default         = 3
}

variable "disk_resources" {
  type = map(object({
    name          = string
    size          = number
    type          = string
    zone          = string   
  }))
  default = {
    disk = {
      name          = "additional-disk"
      size          = 1
      type          = "network-hdd"
      zone          = "ru-central1-a"
           }
  }
  }

#storage vm variables
variable "vm_storage_name" {
  type        = string
  default     = "storage"
}

variable "vm_storage_cores" {
  type        = number
  default     = 2
}

variable "vm_storage_memory" {
  type        = number
  default     = 1
}

variable "vm_storage_core_fraction" {
  type        = number
  default     = 20
}

variable "vm_storage_disk_size" {
  type        = number
  default     = 10
}

variable "vm_storage_disk_type" {
  type        = string
  default     = "network-hdd"
}

variable "vm_storage_preemptible" {
  type        = bool
  default     = true
}

variable "vm_storage_nat" {
  type        = bool
  default     = true
}