terraform {
  #backend "pg" {
  #  schema_name = "github_repo_state"
  #}
  backend "azurerm" {
    subscription_id      = "504cc02b-11a6-43b5-a670-117bc2a9c30a"
    resource_group_name  = "devops"
    storage_account_name = "stvddevops"
    container_name       = "tfstate"
    key                  = "github/repos.tfstate"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.24.0"
    }
  }
  required_version = ">= 1.2"
}

module "github_repo" {
  for_each = try(local.repos, {})

  source = "./_module"
  repo   = merge({ name = each.key }, each.value)
}
