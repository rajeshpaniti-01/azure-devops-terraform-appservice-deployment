variable "location" {
  description = "Azure region."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service Plan name."
  type        = string
}

variable "web_app_name" {
  description = "Globally unique Web App name."
  type        = string
}

variable "app_service_sku" {
  description = "App Service Plan SKU."
  type        = string
  default     = "B1"
}

variable "node_version" {
  description = "Node.js runtime version."
  type        = string
  default     = "24-lts"
}
