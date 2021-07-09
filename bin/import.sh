#!/bin/bash
set -e

REPOS=("vaclav-dvorak")

for REPONAME in ${REPOS[@]}; do
  terraform import "module.github_repos[\"$REPONAME\"].github_repository.repo" $REPONAME
  terraform import "module.github_repos[\"$REPONAME\"].github_branch.main" $REPONAME:main
  terraform import "module.github_repos[\"$REPONAME\"].github_branch_default.main" $REPONAME
done
