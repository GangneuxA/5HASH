variable "prestashop_version" {
  description = "Version de PrestaShop à utiliser"
  type        = string
  default     = "1.7"
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
