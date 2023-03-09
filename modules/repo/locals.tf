locals {
  gitignore_template = try(var.repo.gitignore_template, "Node")
}
