export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk selfupdate
brew update
#brew upgrade
brew outdated | xargs brew upgrade

bundle update --all
#gem update --system
#gem update asciidoctor-pdf t
upgrade_oh_my_zsh
npm update -g jira-node-cli --save
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip

