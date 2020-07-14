#!/usr/bin/env bash
# Use rustup to install the Rust compiler (rustc) and the Rust package manager (cargo).
echo "Installing Rust compiler and package manager"
rustup-init -y
rustup component add rustfmt
