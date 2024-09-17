variable "network_name" {
  description = "Nom du réseau Docker"
  type        = string
}

variable "container_name_prefix" {
  description = "Préfixe pour nommer les conteneurs"
  type        = string
  default     = "ngnix"
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
