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

variable "postgre_administrator_login" {
    description = "The admin login of postgresql"
    type        = string
}

variable "postgre_administrator_login_password" {
    description = "The admin password of postgresql"
    type        = string
}

variable "postgre_sku_name" {
    description = "The sku of postgresql"
    type        = string
}

variable "postgre_version" {
    description = "The version of postgresql"
    type        = string
}

variable "postgre_storage_mb" {
    description = "The storage size of postgresql"
    type        = string
}