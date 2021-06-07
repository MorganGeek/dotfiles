#!/usr/bin/env bash
# Use rustup to install the Rust compiler (rustc) and the Rust package manager (cargo).
echo "Installing Rust compiler and package manager"
rustup-init -y
rustup component add rustfmt

git clone git@github.com:njaremko/podcast.git "$HOME/Code/podcast"
cd "$HOME/Code/podcast" || exit
cargo install --path=.
mkdir "$ZSH_CUSTOM/plugins/podcast" && podcast completion zsh >"$ZSH_CUSTOM/plugins/podcast/_podcast"
cd "$HOME" || exit
