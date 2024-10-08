#Инстанс db (for_each-vm)

resource "yandex_compute_instance" "db" {

  for_each = { for key, val in var.db_resources : key => val }
  name            = each.value.name
  hostname        = each.value.hostname
  platform_id     = each.value.platform_id
  zone            = each.value.default_zone
  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_size
      type     = each.value.disk_type      
    }
  }
  
  metadata = {
    serial-port-enable  = var.serial-port-enable
    ssh-keys            = local.vms_ssh_root_key
  }

  scheduling_policy {
    preemptible = each.value.preemptible
    }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat
  }
  allow_stopping_for_update = true
}