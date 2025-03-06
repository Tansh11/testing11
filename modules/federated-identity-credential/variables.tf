

variable "federated_identity_credential_name" {
  description = "The name of the federated identity credential."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "user_assigned_identity_id" {
  description = "The ID of the User Assigned Managed Identity."
  type        = string
}

variable "subject" {
  description = "The subject for the federated identity credential."
  type        = string
}

variable "audience_name" {
  description = "The audience for the federated identity credential."
  type        = string
}

variable "issuer_url" {
  description = "The issuer URL for the federated identity credential."
  type        = string
}
