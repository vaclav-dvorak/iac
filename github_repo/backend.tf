terraform {
  # backend "local" {}
  backend "azurerm" {
    subscription_id      = "504cc02b-11a6-43b5-a670-117bc2a9c30a"
    resource_group_name  = "devops"
    storage_account_name = "stvddevops"
    container_name       = "tfstate"
    key                  = "github/repos.tfstate"
  }
}
