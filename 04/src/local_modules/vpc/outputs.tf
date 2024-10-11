output "out_network" {
  description = "The ID of the created network"
  value       = yandex_vpc_network.network
}

output "out_subnet" {
  description = "The ID of the created subnet"
  value       = yandex_vpc_subnet.subnet
}