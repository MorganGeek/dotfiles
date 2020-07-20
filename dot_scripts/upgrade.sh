#!/usr/bin/env zsh
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk selfupdate

# Upgrade
echo "Upgrading apps"

# Upgrading HomeBrew stuff
case "$(uname -s)" in
Darwin)
    echo "(Mac OS X) Homebrew upgrading stuff"
    brew update
    #brew upgrade
    brew outdated | xargs brew upgrade
    ;;
esac

bundle update --all
#gem update --system
#gem update asciidoctor-pdf t
zsh ~/.oh-my-zsh/tools/upgrade.sh
sudo pip install --upgrade pip 2>/dev/null
sudo pip3 install --upgrade pip 2>/dev/null
pip list --outdated --format=freeze G -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
pip freeze >~/requirements.txt
# Update VIM plugins installed via Vundle https://github.com/VundleVim/Vundle.vim
vim +PluginUpdate +qall >/dev/null
rustup update
npm update -g moro
pre-commit autoupdate
