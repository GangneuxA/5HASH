variable "prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "staging"
}

variable "network" {
  description = "Docker network"
  type        = string
  default     = "my_prestashop_network-stating"
}

variable "mysql_root_password" {
  description = "Sensitive Root password pour bdd mysql"
  type        = string
  sensitive = true
}

variable "mysql_user" {
  description = "User pour bdd mysql"
  type        = string
  default     = "prestashop_user"
}

variable "mysql_password" {
  description = "Sensitive user password pour bdd mysql"
  type        = string
  sensitive = true
}

variable "mysql_database" {
  description = "Nom bdd pour bdd mysql"
  type        = string
  default     = "prestashop_db"
}

variable "admin_mail" {
  description = "Address mail administrateur"
  type        = string
  default     = "admin@admin.fr"
}

variable "admin_passwd" {
  description = "password administrateur"
  type        = string
  sensitive = true
}

variable "replica_count" {
  description = "Nombres de réplica voulue"
  type = number
  default = 3
}

