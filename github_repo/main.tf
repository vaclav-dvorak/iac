terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "vaclav-dvorak"

    workspaces {
      name = "github-repos"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.12.0"
    }
  }
  required_version = ">= 0.14"
}

module "github_repos" {
  for_each = try(local.repos, {})

  source = "./_module"
  repo   = merge({ name = each.key }, each.value)
}
