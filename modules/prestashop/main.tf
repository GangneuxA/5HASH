# Génération du fichier NGINX
resource "local_file" "nginx_config" {
  filename = "${path.module}/generated_nginx.conf"
  content  = templatefile(replace("${path.module}/nginx.conf.tpl", "/", "\\"), {
    container_name_prefix = var.container_name_prefix,
    replica_count         = var.replica_count
  })
}

resource "docker_network" "prestashop_network" {
  name = var.network_name
}

resource "docker_image" "mysql_image" {
  name = "mysql:5.7"
  keep_locally = false
}

resource "docker_image" "prestashop_image" {
  name = "prestashop/prestashop:${var.prestashop_version}"
  keep_locally = false
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "mysql_container" {
  image = docker_image.mysql_image.image_id
  name  = "${var.container_name_prefix}-mysql"
  
  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}"
  ]

  networks_advanced {
    name = docker_network.prestashop_network.name
  }

  ports {
    internal = 3306
    external = 3306
  }

  restart = "always"
}

resource "docker_container" "prestashop_container" {
  count = var.replica_count

  image = docker_image.prestashop_image.image_id
  name  = "${var.container_name_prefix}-prestashop-${count.index}"

  env = [
    "DB_SERVER=${docker_container.mysql_container.name}",
    "DB_NAME=${var.mysql_database}",
    "DB_USER=${var.mysql_user}",
    "DB_PASSWD=${var.mysql_password}"
  ]

  networks_advanced {
    name = docker_network.prestashop_network.name
  }

  restart = "always"
}

# Conteneur NGINX comme load balancer
resource "docker_container" "nginx_lb_container" {
  image = docker_image.nginx_image.image_id
  name  = "${var.container_name_prefix}-nginx-lb"

  networks_advanced {
    name = docker_network.prestashop_network.name
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
