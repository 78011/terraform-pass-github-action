variable "postgre_name" {
    description = "The name to use for postgresql"
    type        = string
}

variable "postgre_location" {
    description = "The location of postgresql"
    type        = string
}

variable "postgre_rg" {
    description = "The resource group of postgresql"
    type        = string
}

variable "postgre_login" {
    description = "The admin login of postgresql"
    type        = string
}

variable "postgre_password" {
    description = "The admin password of postgresql"
    type        = string
}