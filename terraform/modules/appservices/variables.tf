variable "app_service_plan_name"     { type = string }
variable "app_service_plan_location" { type = string }
variable "app_service_plan_rg"       { type = string }
variable "app_service_plan_sku"      { type = string, default = "F1" }
variable "app_service_name"          { type = string }
variable "app_service_location"      { type = string }
variable "app_service_rg"            { type = string }
variable "app_service_tag_env"       { type = string }