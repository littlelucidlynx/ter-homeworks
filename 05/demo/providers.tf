# cat ~/.aws/config 
# [default]
# region=ru-central1
# cat ~/.aws/credentials 
# [default]
# aws_access_key_id = YCAJEK...
# aws_secret_access_key = YCMBzZ3...


#For terraform >=1.6<=1.8.5

terraform {
  required_version = ">=1.8.4"

  backend "s3" {
    
    shared_credentials_files = ["~/.aws/credentials"]
#    shared_config_files = ["~/.aws/config"]
    profile = "default"
    region  = "ru-central1"

    bucket  = "littlelucidlynx-bucket" #FIO-netology-tfstate
    key     = "study/terraform.tfstate"
    

    # access_key                  = "..."          #Только для примера! Не хардкодим секретные данные!
    # secret_key                  = "..."          #Только для примера! Не хардкодим секретные данные!


    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  endpoints ={
    dynamodb  = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g393ugq43uqc1r3n8a/etno7gv7lbpp4nj56uaq"
    s3        = "https://storage.yandexcloud.net"
  }

    dynamodb_table = "tfstate"
  }

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.130.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }

  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file(var.yc_ssh_key_path)
  zone                     = var.default_zone 
}

# For terraform <1.6.0
# terraform {
#   required_providers {
#   }
#   backend "s3" {
#     bucket   = "...."
#     endpoint = "storage.yandexcloud.net"
#     key      = "..../terraform.tfstate"
#     region   = "ru-central1"
#     # access_key                  = "..."          #Только для примера! Не хардкодим секретные данные!
#     # secret_key                  = "..."          #Только для примера! Не хардкодим секретные данные!

#     dynamodb_table    = "tfstate-lock-develop" #таблица блокировок
#     dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/........."

#     skip_region_validation      = true
#     skip_credentials_validation = true
#   }
#   required_version = "~>1.8.4"
# }
