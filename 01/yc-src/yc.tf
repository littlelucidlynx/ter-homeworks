terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=1.8.4"
}

provider "docker" {
  host = "ssh://eurus-cloud@84.201.151.41"
}

# Пароль для root
resource "random_password" "mysql_root_password" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

# Пароль для пользователя
resource "random_password" "mysql_password" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

# Образ mysql
resource "docker_image" "mysql_image" {
  name         = "mysql:8"
  keep_locally = true
}

# Контейнер с маппингом порта 3306
resource "docker_container" "mysql_container" {
  image = docker_image.mysql_image.image_id
  name  = "mysql_server"

  ports {
    internal = 3306
    external = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.mysql_password.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}