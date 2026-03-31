variable "service_plan_name" {
    description = "The name for our app service plan"
    type        = string
}

variable "service_plan_location" {
    description = "The location of the app service plan"
    type        = string
}

variable "service_plan_rg" {
    description = "The resource group of the app_service_plan"
    type        = string
}

variable "service_plan_os" {
    description = "The OS of the app service plan (e.g., Linux or Windows)"
    type        = string
}

variable "service_plan_sku" {
    description = "The sku of the app_service_plan"
    type        = string
}

variable "app_name" {
    description = "The name for our app service"
    type        = string
}

variable "app_location" {
    description = "The location of the app service"
    type        = string
}

variable "app_rg" {
    description = "The resource group of the app_service"
    type        = string
}

variable "app_tag_env" {
    description = "The environment tag of the app_service"
    type        = string
}

variable "db_host" {
    description = "L'adresse (FQDN) du serveur PostgreSQL"
    type        = string
}