#!/usr/bin/env bash

echo "Hello $(whoami)! Let's get you set up."

# Make sure Code directory exists
echo "mkdir -p $HOME/Code"
mkdir -p ~/Code
ln -snf ~/Code/dotfiles/dot_scripts ~/.scripts
chmod +x ~/.scripts/*.sh

~/.scripts/install_linux_packages.sh
~/.scripts/install_homebrew.sh

# Path to ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Create symbolic links
~/.scripts/symbolic_links.sh

# Install user applications
~/.scripts/install_macpackages.sh
~/.scripts/install_linux_user_apps.sh

# Switch to ZSH
echo "switching to ZSH"
command -v zsh >>/etc/shells
chsh -s "$(command -v zsh)"

~/.scripts/sdkmandeps.sh
~/.scripts/rubydeps.sh
~/.scripts/bundlerdeps.sh
~/.scripts/ohmyzshdeps.sh
~/.scripts/vimdeps.sh
~/.scripts/install_no-more-secrets.sh
~/.scripts/load_macos_defaults.sh
~/.scripts/configure_etc_hosts.sh
~/.scripts/pythondeps.sh
~/.scripts/install_baton.sh
~/.scripts/rustdeps.sh
~/.scripts/npmdeps.sh

terraform-docs completion zsh >/usr/local/share/zsh/site-functions/_terraform-docs
autoload -U compinit && compinit

~/.scripts/godeps.sh
~/.scripts/install_weavescope.sh
~/.scripts/install_bashtop.sh
~/.scripts/install_awsls.sh
~/.scripts/configure_git_hooks.sh
~/.scripts/upgrade.sh
~/.scripts/reload.sh
