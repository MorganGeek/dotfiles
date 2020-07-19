#!/usr/bin/env bash
# OSX Defaults
case "$(uname -s)" in
Darwin)
    echo "(Mac OS X) Loading preferences"
    sudo sh "$HOME/.macos"
    ln -snf "$HOME/Code/dotfiles/com.googlecode.iterm2.plist" "$HOME/com.googlecode.iterm2.plist"
    ;;
esac
