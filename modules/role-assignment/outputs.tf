
output "role_assignment_id" {
  value       = azurerm_role_assignment.role.id
  description = "The ID of the role assignment."
}
