variable "prestashop_version" {
  description = "Version de PrestaShop à utiliser"
  type        = string
  default     = "8.1-apache"
}

variable "network_name" {
  description = "Nom du réseau Docker"
  type        = string
  default     = "prestashop-network"
}

variable "container_name_prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "prestashop"
}

variable "mysql_root_password" {
  description = "Mot de passe root pour MySQL"
  type        = string
}

variable "mysql_database" {
  description = "Nom de la base de données MySQL"
  type        = string
  default     = "prestashop_db"
}

variable "mysql_user" {
  description = "Nom de l'utilisateur MySQL"
  type        = string
  default     = "prestashop_user"
}

variable "mysql_password" {
  description = "Mot de passe pour l'utilisateur MySQL"
  type        = string
}

variable "replica_count" {
  description = "Nombre de réplicas PrestaShop pour scalabilité"
  type        = number
  default     = 1
}

variable "load_balancer_port" {
  description = "Port exposé par le load balancer sur l'hôte"
  type        = number
  default     = 8080
}

variable "disable_make" {
  type        = string
  default     = "0"
  description = "Disable make in PrestaShop"
}

variable "ps_install_auto" {
  type        = string
  default     = "1"
  description = "Auto install PrestaShop"
}

variable "db_prefix" {
  type        = string
  default     = "ps_"
  description = "Database prefix"
}

variable "ps_folder_install" {
  type        = string
  default     = "install"
  description = "PrestaShop install folder"
}

variable "ps_folder_admin" {
  type        = string
  default     = "admin"
  description = "PrestaShop admin folder"
}

variable "ps_country" {
  type        = string
  default     = "fr"
  description = "PrestaShop country"
}

variable "ps_language" {
  type        = string
  default     = "en"
  description = "PrestaShop language"
}

variable "ps_dev_mode" {
  type        = string
  default     = "0"
  description = "Enable developer mode"
}

variable "ps_enable_ssl" {
  type        = string
  default     = "0"
  description = "Enable SSL"
}

variable "ps_erase_db" {
  type        = string
  default     = "0"
  description = "Erase database on install"
}

variable "ps_use_docker_maildev" {
  type        = string
  default     = "0"
  description = "Use Docker Maildev"
}

variable "admin_mail" {
  type        = string
  description = "Admin email"
}

variable "admin_passwd" {
  type        = string
  description = "Admin password"
  sensitive = true
}

variable "blackfire_enable" {
  type        = string
  default     = "0"
  description = "Enable Blackfire"
}

variable "blackfire_server_id" {
  type        = string
  default     = "0"
  description = "Blackfire server ID"
}

variable "blackfire_server_token" {
  type        = string
  default     = "0"
  description = "Blackfire server token"
}

variable "mysql_host_name" {
  type        = string
}