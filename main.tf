module "identity-resource-group" {
  source   = "../modules/resource-group"
  name     = var.identity_rg_name
  location = var.location
  tags     = var.tags
}

module "gh_usi" {
  source   = "../modules/user-assigned-identity"
  name     = "${var.gh_uai_name}-${var.environment}"
  location = var.location
  rg_name  = module.identity-resource-group.name
  tags     = var.tags
}

