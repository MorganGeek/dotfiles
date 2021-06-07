#!/usr/bin/env bash
echo "Installing Broot"
ln -snf "$HOME/Code/dotfiles/private_dot_config/broot/conf.toml" "$HOME/.config/broot/conf.toml"
broot --install
