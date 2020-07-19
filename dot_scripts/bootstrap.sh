#!/usr/bin/env bash

echo "Hello $(whoami)! Let's get you set up."

# Make sure Code directory exists
echo "mkdir -p $HOME/Code"
mkdir -p "$HOME/Code"
ln -snf "$HOME/Code/dotfiles/dot_scripts" "$HOME/.scripts"
chmod +x "$HOME/.scripts/*.sh"

"$HOME/.scripts/install_linux_packages.sh"
"$HOME/.scripts/install_homebrew.sh"

# Path to ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Create symbolic links
"$HOME/.scripts/symbolic_links.sh"

# Install user applications
"$HOME/.scripts/install_macpackages.sh"
"$HOME/.scripts/install_linux_user_apps.sh"

# Switch to ZSH
echo "switching to ZSH"
command -v zsh >>/etc/shells
chsh -s "$(command -v zsh)"

"$HOME/.scripts/sdkmandeps.sh"
"$HOME/.scripts/rubydeps.sh"
"$HOME/.scripts/bundlerdeps.sh"
"$HOME/.scripts/ohmyzshdeps.sh"
"$HOME/.scripts/vimdeps.sh"
"$HOME/.scripts/load_macos_defaults.sh"
"$HOME/.scripts/configure_etc_hosts.sh"
"$HOME/.scripts/pythondeps.sh"
"$HOME/.scripts/install_baton.sh"
"$HOME/.scripts/rustdeps.sh"
"$HOME/.scripts/npmdeps.sh"

terraform-docs completion zsh >/usr/local/share/zsh/site-functions/_terraform-docs
autoload -U compinit && compinit

"$HOME/.scripts/godeps.sh"
"$HOME/.scripts/install_weavescope.sh"
"$HOME/.scripts/install_bashtop.sh"
"$HOME/.scripts/install_awsls.sh"
"$HOME/.scripts/configure_git_hooks.sh"
"$HOME/.scripts/upgrade.sh"
"$HOME/.scripts/reload.sh"
