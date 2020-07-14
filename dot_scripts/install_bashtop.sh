#!/usr/bin/env bash
# Install bashtop (until brew manages it)
git clone https://github.com/aristocratos/bashtop.git ~/Code/bashtop
cd ~/Code/bashtop || exit
sudo make install
cd "$HOME" || exit
