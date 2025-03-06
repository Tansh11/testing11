
provider "azurerm" {
  features {}
}

# Fetch subscription details using the data source
data "azurerm_subscription" "sub" {}

# Create the resource group for the identity (can be omitted if already created)
module "identity-resource-group" {
  source   = "../modules/resource-group"
  name     = var.identity_rg_name
  location = var.location
  tags     = var.tags
}

# Create the user-assigned identity
module "gh_usi" {
  source   = "../modules/user-assigned-identity"
  name     = var.gh_uai_name
  location = var.location
  rg_name  = module.identity-resource-group.name
  tags     = var.tags
}

# Assign the Owner role to the user-assigned identity
module "sub_owner_role_assignment" {
  source       = "../modules/role-assignment"
  principal_id = module.gh_usi.user_assinged_identity_principal_id
  role_name    = "Owner"
  principal_type = "ServicePrincipal"
  scope_id     = data.azurerm_subscription.sub.id  # Using the subscription ID from the data source
}
