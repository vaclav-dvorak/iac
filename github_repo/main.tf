terraform {
  backend "pg" {
    schema_name = "github_repo_state"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.12.0"
    }
  }
  required_version = ">= 0.14"
}

module "github_repo" {
  for_each = try(local.repos, {})

  source = "./_module"
  repo   = merge({ name = each.key }, each.value)
}
