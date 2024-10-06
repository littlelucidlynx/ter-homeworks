output "virtual_machines_output_information" {
  value = {
    vm_web = {
      instance_name = yandex_compute_instance.web.name
      external_ip   = yandex_compute_instance.web.network_interface.0.nat_ip_address
      fqdn          = yandex_compute_instance.web.fqdn
    }
    vm_db = {
      instance_name = yandex_compute_instance.db.name
      external_ip   = yandex_compute_instance.db.network_interface.0.nat_ip_address
      fqdn          = yandex_compute_instance.db.fqdn
    }
  }
}