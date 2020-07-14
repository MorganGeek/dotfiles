#!/usr/bin/env bash

# Install missing package (Linux)
case "$(uname -s)" in
    Linux)
        echo "(Linux) Installing Development Tools"
        yum install sudo -y
        sudo yum groupinstall 'Development Tools' -y
        sudo yum install git which zip unzip ruby curl file docker gcc make libxcrypt-compat vim-enhanced -y
        ;;
esac
