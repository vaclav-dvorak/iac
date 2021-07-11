#!/bin/bash
set -e

REPOS=( "dpd-test" "toulky" "bara" "wsl-setup" "vaclav-dvorak" "apprepo-dash" "game-of-life" "go-api-hello-world" "go101" "frajer" "fiddo" "vccsturm" "summit-formule" "devops-workshop" "maze" "summit-pokemon" "mefbox" "anna-helmova" )

for REPONAME in ${REPOS[@]}; do
  terraform import "module.github_repo[\"$REPONAME\"].github_repository.repo" $REPONAME
  terraform import "module.github_repo[\"$REPONAME\"].github_branch.main" $REPONAME:main
  terraform import "module.github_repo[\"$REPONAME\"].github_branch_default.main" $REPONAME
done
