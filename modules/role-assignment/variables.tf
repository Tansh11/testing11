
variable "principal_id" {
  description = "The principal ID of the user-assigned managed identity."
  type        = string
}

variable "principal_type" {
  description = "The principal type for the role assignment (e.g., 'ServicePrincipal')."
  type        = string
}

variable "role_name" {
  description = "The name of the role to assign (e.g., 'Owner')."
  type        = string
}

variable "scope_id" {
  description = "The scope of the role assignment (e.g., subscription ID)."
  type        = string
}
