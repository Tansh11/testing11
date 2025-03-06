# variables.tf (Root Directory)

variable "identity_rg_name" {
  description = "The name of the resource group for the user-assigned identity."
  type        = string
}

variable "location" {
  description = "The location where resources will be created."
  type        = string
}

variable "gh_uai_name" {
  description = "The base name of the user-assigned identity."
  type        = string
}

variable "tags" {
  description = "Tags to be assigned to resources."
  type        = map(string)
}
