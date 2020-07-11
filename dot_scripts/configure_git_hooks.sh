#!/usr/bin/env bash
# Copy pre-commit hooks
cd ~/Code/dotfiles || exit
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template
copyhooks
