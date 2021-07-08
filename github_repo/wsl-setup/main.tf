terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "vaclav-dvorak"

    workspaces {
      name = "wsl-setup"
    }
  }
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 4.12.0"
    }
  }
  required_version = ">= 0.14"
}

locals {
  name = "wsl-setup"
  tag = "git"
}
