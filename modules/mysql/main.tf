# Volume pour la bdd master
resource "docker_volume" "mysql_master_data" {
  name = "${var.container_name_prefix}-mysql_master_data"
}

# Volume pour chaque réplicat
resource "docker_volume" "mysql_replica_data" {
  count = var.mysql_replica_count
  name  = "${var.container_name_prefix}-mysql_replica_data_${count.index}"
}

# network de tout les pods
resource "docker_network" "prestashop_network" {
  name = var.network_name
}

# choix de l'image 
resource "docker_image" "mysql_image" {
  name = "mysql:5.7"
  keep_locally = true
}

# création de la bases de donées master
resource "docker_container" "mysql_master" {
  image = docker_image.mysql_image.image_id
  name  = "${var.container_name_prefix}-mysql-master"
  
  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}",
    "MYSQL_REPLICATION_MODE=master",
    "MYSQL_REPLICATION_USER=repl_user",
    "MYSQL_REPLICATION_PASSWORD=repl_password",
  ]

  networks_advanced {
    name = docker_network.prestashop_network.name
  }

  ports {
    internal = 3306
    external = 3306
  }

  volumes {
    volume_name    = docker_volume.mysql_master_data.name
    container_path = "/var/lib/mysql"
  }

  restart = "always"
}

# création des bases de donées réplicat
resource "docker_container" "mysql_replica" {
  count = var.mysql_replica_count

  image = docker_image.mysql_image.image_id
  name  = "${var.container_name_prefix}-mysql-replica-${count.index}"
  
  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=${var.mysql_database}",
    "MYSQL_USER=${var.mysql_user}",
    "MYSQL_PASSWORD=${var.mysql_password}",
    "MYSQL_REPLICATION_MODE=replica",
    "MYSQL_REPLICATION_USER=repl_user",
    "MYSQL_REPLICATION_PASSWORD=repl_password",
    "MYSQL_MASTER_HOST=${docker_container.mysql_master.name}",
  ]

  networks_advanced {
    name = docker_network.prestashop_network.name
  }

  ports {
    internal = 3306
    external = 0  
  }
  volumes {
    volume_name    = docker_volume.mysql_replica_data[count.index].name
    container_path = "/var/lib/mysql"
  }

  restart = "always"
}

