#Инстанс web (count-vm)

resource "yandex_compute_instance" "web" {

#Инстанс web (count-vm) должен создаваться после инстанса db (for_each-vm)
depends_on = [yandex_compute_instance.db]

  count           = var.vm_web_count
  name            = "${var.vm_web_prefix_name}-${count.index + 1}"
  hostname        = "${var.vm_web_prefix_name}-${count.index + 1}"
  platform_id     = var.web_resources["web"].platform_id
  zone            = var.web_resources["web"].default_zone
  resources {
    cores         = var.web_resources["web"].cores
    memory        = var.web_resources["web"].memory
    core_fraction = var.web_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
        size          = var.web_resources["web"].disk_size
        type          = var.web_resources["web"].disk_type
        image_id      = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible   = var.web_resources["web"].preemptible
  }
  network_interface {
    subnet_id           = yandex_vpc_subnet.develop.id
    nat                 = var.web_resources["web"].nat
    security_group_ids  = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable  = var.serial-port-enable
    ssh-keys            = local.vms_ssh_root_key
  }
}