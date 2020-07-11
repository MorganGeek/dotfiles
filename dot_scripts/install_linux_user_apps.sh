#!/usr/bin/env bash
# Install dependencies (apps, fonts, ...) for CentOS
case "$(uname -s)" in
    Linux)
        echo "(CentOS) Installing stuff (apps, ...)"
        chmod +x ~/Code/dotfiles/centos.sh
        ~/Code/dotfiles/centos.sh
        ;;
esac
