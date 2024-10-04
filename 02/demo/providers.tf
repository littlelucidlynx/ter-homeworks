terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.124.0"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
  #token                    = "do not use!!!"
  cloud_id                 = "b1g393ugq43uqc1r3n8a"
  folder_id                = "b1guvvhgbqd0n8591q7k"
  service_account_key_file = file("~/.authorized_key.json")
  #zone                     = "ru-central1-a" #(Optional) 
}

# You can set TF_LOG to one of the log levels (in order of decreasing verbosity) TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs.
# export TF_LOG=DEBUG
