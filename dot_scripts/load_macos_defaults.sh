#!/usr/bin/env bash
# OSX Defaults
case "$(uname -s)" in
    Darwin)
        echo "(Mac OS X) Loading preferences"
        sudo sh "$HOME/.macos"
        ;;
esac
