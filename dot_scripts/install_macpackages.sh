#!/usr/bin/env bash

# Install dependencies (apps, fonts, ...) with Brew
case "$(uname -s)" in
    Darwin)
        echo "(Mac OS X) Brew installing stuff (apps, fonts, ...)"
        ln -snf ~/Code/dotfiles/Brewfile ~/Brewfile
        brew bundle
        ;;
esac
