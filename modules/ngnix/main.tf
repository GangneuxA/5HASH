# Génération du fichier de configuration NGINX
resource "local_file" "nginx_config" {
  filename = "${path.module}/generated_nginx.conf"
  content  = templatefile(replace("${path.module}/nginx.conf.tpl", "/", "\\"), {
    container_name_prefix = var.container_name_prefix,
    replica_count         = var.replica_count
  })
}

# Image NGINX docker
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
  keep_locally = true
}

# Conteneur NGINX comme load balancer
resource "docker_container" "nginx_lb_container" {
  image = docker_image.nginx_image.image_id
  name  = "${var.container_name_prefix}-nginx-lb"

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 80
    external = var.load_balancer_port
  }

  restart = "always"

  # Utilisation du fichier généré pour NGINX
  volumes {
    host_path      = replace(abspath("${path.module}/generated_nginx.conf"), "/", "\\")
    container_path = "/etc/nginx/nginx.conf"
  }
}
