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

#Путь к публичному ключу для подключения к yandex cloud
variable "yc_ssh_key_path" {
  description = "Путь к открытому ключу SSH для подключения к облаку"
  type        = string
  default     = "~/.authorized_key.json"
}

variable "ip_address_cidrhost" {
  description = "ip-адрес"
  type        = string
#  default     = "192.168.0.1"
  default     = "1920.1680.0.1"
  validation {
    condition     = can(cidrhost("${var.ip_address_cidrhost}/32", 0))
    error_message = "Неверный IP адрес - не соответствует шаблону"
  }
}

variable "ip_address_regex" {
  description = "ip-адрес"
  type        = string
#  default     = "192.168.0.1"
  default     = "1920.1680.0.1"
  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", var.ip_address_regex))
    error_message = "Неверный IP адрес - не соответствует шаблону"
  }
}

variable "ip_address_list" {
  description = "список ip-адресов"
  type        = list(string)
#  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  validation {
    condition = alltrue([for address in var.ip_address_list: can(regex("^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$", address))])
    error_message = "Неверный список IP адресов - не соответствует шаблону"
  }
}