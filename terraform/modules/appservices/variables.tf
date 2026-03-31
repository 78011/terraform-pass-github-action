variable "app_service_plan_name" {
    description = "The name for our app service plan"
    type        = string
}

variable "app_service_plan_location" {
    description = "The location of the app service plan"
    type        = string
}

variable "app_service_plan_rg" {
    description = "The resource group of the app_service_plan"
    type        = string
}

variable "app_service_plan_tiers" {
    description = "The tiers of the app_service_plan"
    type        = string
}

variable "app_service_plan_sku" {
    description = "The sku of the app_service_plan"
    type        = string
}

variable "app_service_name" {
    description = "The name for our app service"
    type        = string
}

variable "app_service_location" {
    description = "The location of the app service"
    type        = string
}

variable "app_service_rg" {
    description = "The resource group of the app_service"
    type        = string
}

variable "app_service_tag_env" {
    description = "The environment tag of the app_service"
    type        = string
}