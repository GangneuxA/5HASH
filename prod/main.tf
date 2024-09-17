module "mysql" {
  source = "../modules/mysql"
  network_name          = var.network
  container_name_prefix = var.prefix
  mysql_root_password   = var.mysql_root_password
  mysql_user            = var.mysql_user
  mysql_password        = var.mysql_password
  mysql_database        = var.mysql_database
  mysql_replica_count   = 3
}

module "prestashop" {
  source = "../modules/prestashop"

  prestashop_version    = "8.1-apache"
  network_name          = module.mysql.docker_network_name
  container_name_prefix = var.prefix
  mysql_root_password   = var.mysql_root_password
  mysql_user            = var.mysql_user
  mysql_password        = var.mysql_password
  mysql_database        = var.mysql_database
  mysql_host_name       = module.mysql.mysql_container_name
  replica_count         = var.replica_count
  admin_mail            = var.admin_mail
  admin_passwd          = var.admin_passwd
}

module "ngnix" {
  source = "../modules/ngnix"

  network_name          = module.mysql.docker_network_name
  container_name_prefix = var.prefix
  replica_count         = var.replica_count
  load_balancer_port    = 8080

}