resource "yandex_compute_disk" "disk" {
    count         = var.disk_count
    name          = "${var.disk_resources["disk"].name}-${count.index}"
    size          = var.disk_resources["disk"].size
    type          = var.disk_resources["disk"].type
    zone          = var.disk_resources["disk"].zone
}

resource "yandex_compute_instance" "storage" {

depends_on = [yandex_compute_disk.disk]

  name        = var.vm_storage_name
  hostname    = var.vm_storage_name
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vm_storage_cores
    memory        = var.vm_storage_memory
    core_fraction = var.vm_storage_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_storage_disk_type
      size     = var.vm_storage_disk_size
    }
  }
  
  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.disk[*].id)
    content {
      disk_id     = secondary_disk.key
      auto_delete = true
    }
  }

  metadata = {
    serial-port-enable  = var.serial-port-enable
    ssh-keys            = local.vms_ssh_root_key
  }

  scheduling_policy {
    preemptible   = var.vm_storage_preemptible
  }

  network_interface {
    subnet_id     = yandex_vpc_subnet.develop.id
    nat           = var.vm_storage_nat
  }
  allow_stopping_for_update = true

}