
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
  sensitive   = true
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
  sensitive   = true
}
variable "mysql_replica_count" {
  description = "Nombre de réplicas MySQL"
  default     = 2
}
