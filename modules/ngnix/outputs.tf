output "load_balancer_url" {
  description = "URL du Load Balancer NGINX"
  value       = "http://${docker_container.nginx_lb_container.name}:${var.load_balancer_port}"
}
