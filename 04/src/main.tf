###
/*
#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#создаем подсеть a
resource "yandex_vpc_subnet" "develop_a" {
  name           = "${var.vpc_name}-${var.subnet_a_zone}"
  zone           = var.subnet_a_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_a_cidr
}

#создаем подсеть b
resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.vpc_name}-${var.subnet_b_zone}"
  zone           = var.subnet_b_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_b_cidr
}
*/
module "vpc" {
  source         = "./local_modules/vpc"
  network_name   = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/littlelucidlynx/yandex_compute_instance.git?ref=main"
  env_name       = var.marketing_vm_env
#  network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.out_network.id
#  subnet_zones   = [var.subnet_a_zone,var.subnet_b_zone]
  subnet_zones   = [var.default_zone]
#  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  subnet_ids     = [module.vpc.out_subnet.id]
  instance_name  = var.marketing_vm_instance_name
  instance_count = var.marketing_vm_instance_count
  image_family   = var.marketing_vm_image_family
  public_ip      = var.marketing_vm_public_ip

  labels = { 
    owner        = var.marketing_vm_labels.owner
    project      = var.marketing_vm_labels.project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.marketing_vm_serial_port_enable
  }
}

module "analytics-vm" {
  source         = "git::https://github.com/littlelucidlynx/yandex_compute_instance.git?ref=main"
  env_name       = var.analytics_vm_env 
#  network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.out_network.id
#  subnet_zones   = [var.subnet_a_zone,var.subnet_b_zone]
  subnet_zones   = [var.default_zone]
#  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  subnet_ids     = [module.vpc.out_subnet.id]
  instance_name  = var.analytics_vm_instance_name
  instance_count = var.analytics_vm_instance_count
  image_family   = var.analytics_vm_image_family
  public_ip      = var.analytics_vm_public_ip

  labels = { 
    owner        = var.analytics_vm_labels.owner
    project      = var.analytics_vm_labels.project
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.analytics_vm_serial_port_enable
  }
}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")

	vars = {
		username           = var.vm_username
		ssh_public_key     = file(var.vms_ssh_key_path)
		packages           = jsonencode(var.packages)
	}
	
}