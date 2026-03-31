variable "administrator_login" {
    description = "Value of admin login of postgresql taken from env variables"
    type        = string
    sensitive   = true
}

variable "administrator_login_password" {
    description = "Value of admin password of postgresql taken from env variables"
    type        = string
    sensitive   = true
}