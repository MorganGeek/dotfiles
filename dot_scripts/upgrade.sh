#!/usr/bin/env zsh
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk selfupdate
brew update
#brew upgrade
brew outdated | xargs brew upgrade

bundle update --all
#gem update --system
#gem update asciidoctor-pdf t
zsh ~/.oh-my-zsh/tools/upgrade.sh
sudo pip install --upgrade pip 2>/dev/null
sudo pip3 install --upgrade pip 2>/dev/null
pip freeze > ~/requirements.txt
# Update VIM plugins installed via Vundle https://github.com/VundleVim/Vundle.vim
vim +PluginUpdate +qall
