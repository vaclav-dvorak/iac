module "github_repo" {
  for_each = try(local.repos, {})

  source = "../modules/repo"
  repo   = merge({ name = each.key }, each.value)
}
