output "prestashop_urls" {
  description = "URLs des instances PrestaShop"
  value = [for container in docker_container.prestashop_container : "http://${container.name}:80"]
}

output "mysql_container_name" {
  description = "Nom du conteneur MySQL"
  value       = docker_container.mysql_container.name
}

output "load_balancer_url" {
  description = "URL du Load Balancer NGINX"
  value       = "http://${docker_container.nginx_lb_container.name}:${var.load_balancer_port}"
}
