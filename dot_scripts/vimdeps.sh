#!/usr/bin/env bash
echo "Installing Vundle + VIM Plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall >/dev/null
#https://github.com/ycm-core/YouCompleteMe/blob/master/README.md#installation
cd "$HOME/.vim/bundle/YouCompleteMe" || exit
./install.py --all
mkdir -p "$HOME/.vim/spell"

cd "$HOME" || exit
git clone https://github.com/dbeniamine/cheat.sh-vim.git ~/.vim/cheat.sh-vim
