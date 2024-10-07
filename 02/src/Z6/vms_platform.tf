##vm_web

#variable "vm_web_name" {
#  type    = string
#  default = "netology-develop-platform-web"
#  description = "Instance name"
#}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
  description = "Instance platform ID"
}

#variable "vm_web_cores" {
#  type    = string
#  default = "2"
#  description = "vCPU Cores"
#}

#variable "vm_web_memory" {
#  type    = string
#  default = "1"
#  description = "Memory size"
#}

#variable "vm_web_core_fraction" {
#  type    = string
#  default = "20"
#  description = "vCPU Core fraction"
#}

#variable "vm_web_nat" {
#  type    = bool
#  default = true
#  description = "NAT use"
#}

#variable "vm_web_serial_port_enable" {
#  type    = bool
#  default = true
#  description = "Serial console port use"
#}

#variable "vm_web_preemptible" {
#  type    = bool
#  default = true
#  description = "Preemptible use"
#}

#variable "vm_web_zone" {
#  type        = string
#  default     = "ru-central1-a"
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}

##vm_db

#variable "vm_db_name" {
#  type    = string
#  default = "netology-develop-platform-db"
#  description = "Instance name"
#}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
  description = "Instance platform ID"
}

#variable "vm_db_cores" {
#  type    = string
#  default = "2"
#  description = "vCPU Cores"
#}

#variable "vm_db_memory" {
#  type    = string
#  default = "2"
#  description = "Memory size"
#}

#variable "vm_db_core_fraction" {
#  type    = string
#  default = "20"
#  description = "vCPU Core fraction"
#}

#variable "vm_db_nat" {
#  type    = bool
#  default = true
#  description = "NAT use"
#}

#variable "vm_db_serial_port_enable" {
#  type    = bool
#  default = true
#  description = "Serial console port use"
#}

#variable "vm_db_preemptible" {
#  type    = bool
#  default = true
#  description = "Preemptible use"
#}

#variable "vm_db_zone" {
#  type        = string
#  default     = "ru-central1-b"
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    preemptible   = bool
    nat           = bool
    default_zone  = string   
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      preemptible   = true
      nat           = true      
      default_zone  = "ru-central1-a"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      preemptible   = true
      nat           = true  
      default_zone  = "ru-central1-b"       
    }
  }
}

variable "metadata" {
  type = map
  default = {
    serial-port-enable = true
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICBJOodclPNPYPA2pyGpmraEW7K7qzSFNOw7SFk9JxUq"
    }
}