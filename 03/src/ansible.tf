resource "local_file" "hosts_inventory" {
  content = templatefile("${path.module}/inventory.tftpl",
   {      
    webservers = yandex_compute_instance.web,
    databases  = yandex_compute_instance.db,
    storage    = [yandex_compute_instance.storage]
   }
  )
  filename = "${abspath(path.module)}/inventory"
}