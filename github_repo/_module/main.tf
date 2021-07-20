terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.12.0"
    }
  }
}

resource "github_repository" "repo" {
  lifecycle {
    ignore_changes = [
      auto_init,
      license_template,
      gitignore_template
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
  auto_init              = false
  archived               = false
  topics                 = try(var.repo.topics, [])
  vulnerability_alerts   = try(var.repo.vulnerability_alerts, false)
}

resource "github_branch" "main" {
  depends_on = [
    github_repository.repo
  ]

  repository = github_repository.repo.name
  branch     = try(var.repo.default_branch, "main")
}

resource "github_branch_default" "main" {
  depends_on = [
    github_branch.main
  ]

  repository = github_repository.repo.name
  branch     = try(var.repo.default_branch, "main")
}
