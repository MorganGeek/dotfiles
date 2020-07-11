#!/usr/bin/env zsh
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"


# Reload
echo "Reloading config"

chmod +x ~/.scripts/*.sh
source ~/.zshrc
sdk use java 8.0.222-zulu

# Homebrew reloading stuff
case "$(uname -s)" in
    Darwin)
        echo "(Mac OS X) Homebrew reloading stuff"
        brew bundle
        ;;
esac

# OSX Defaults
case "$(uname -s)" in
    Darwin)
        sudo sh .macos
        ;;
esac
pip freeze >/Users/morganwattiez/Code/dotfiles/requirements.txt
bundle check
