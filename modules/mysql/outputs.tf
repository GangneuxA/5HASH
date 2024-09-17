output "mysql_container_name" {
  description = "Nom du conteneur MySQL"
  value       = docker_container.mysql_master.name
}

output "docker_network_name" {
  description = "Nom du conteneur MySQL"
  value       = docker_network.prestashop_network.name
}
