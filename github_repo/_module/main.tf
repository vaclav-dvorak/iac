terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.31.0"
    }
  }
}

resource "github_repository" "repo" {
  lifecycle {
    ignore_changes = [
      auto_init,
      license_template,
      gitignore_template,
      branches, #! Workaround for integrations/terraform-provider-github#1037.
    ]
  }

  name                   = var.repo.name
  description            = try(var.repo.description, "No description")
  homepage_url           = try(var.repo.homepage_url, null)
  visibility             = try(var.repo.visibility, "private")
  has_issues             = try(var.repo.has_issues, false)
  has_projects           = try(var.repo.has_projects, false)
  has_wiki               = try(var.repo.has_wiki, false)
  allow_merge_commit     = try(var.repo.allow_merge_commit, false)
  allow_rebase_merge     = try(var.repo.allow_rebase_merge, true)
  allow_squash_merge     = try(var.repo.allow_squash_merge, false)
  delete_branch_on_merge = try(var.repo.delete_branch_on_merge, true)
  is_template            = try(var.repo.is_template, false)
  has_downloads          = false #? downloads feature is deprecated anyway
  auto_init              = true
  gitignore_template     = try(var.repo.gitignore_template, "Node")
  license_template       = try(var.repo.license_template, "mit")
  archived               = false
  topics                 = try(var.repo.topics, [])
  vulnerability_alerts   = try(var.repo.vulnerability_alerts, true)
}
