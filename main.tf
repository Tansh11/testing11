
provider "azurerm" {
  features {}
}

# Fetch subscription details using the data source
data "azurerm_subscription" "sub" {}

# Create the resource group for the identity
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

# Federated Identity Credential for Environment (e.g., dev)
module "gh_federated_credential" {
  source                             = "../modules/federated-identity-credential"
  federated_identity_credential_name = "${var.github_organization_target}-${var.github_repository}-${var.environment}"
  rg_name                            = module.identity-resource-group.name
  user_assigned_identity_id          = module.gh_usi.user_assinged_identity_id
  subject                            = "repo:${var.github_organization_target}/${var.github_repository}:environment:${var.environment}"
  audience_name                      = local.default_audience_name
  issuer_url                         = local.github_issuer_url
}

# Federated Identity Credential for Pull Requests
module "gh_federated_credential-pr" {
  source                             = "../modules/federated-identity-credential"
  federated_identity_credential_name = "${var.github_organization_target}-${var.github_repository}-pr"
  rg_name                            = module.identity-resource-group.name
  user_assigned_identity_id          = module.gh_usi.user_assinged_identity_id
  subject                            = "repo:${var.github_organization_target}/${var.github_repository}:pull_request"
  audience_name                      = local.default_audience_name
  issuer_url                         = local.github_issuer_url
}
