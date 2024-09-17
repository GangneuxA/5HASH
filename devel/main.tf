module "prestashop" {
  source = "../modules/prestashop"

  prestashop_version    = "1.7"
  network_name          = "my_prestashop_network"
  container_name_prefix = "myshop"
  mysql_root_password   = "root_password"
  mysql_user            = "prestashop_user"
  mysql_password        = "prestashop_password"
  mysql_database        = "prestashop_db"
  replica_count         = 3
  load_balancer_port    = 8080
}
