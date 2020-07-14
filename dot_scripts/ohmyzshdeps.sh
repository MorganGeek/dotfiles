#!/usr/bin/env bash
# Install Oh My Zsh and some cool dependencies
echo "Installing Oh My Zsh + customizing themes and plugins"
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc >>!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/AlexisBRENON/oh-my-zsh-reminder "$ZSH_CUSTOM/plugins/reminder"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
ln -snf ~/Code/dotfiles/dot_zshrc ~/.zshrc
ln -snf ~/Code/dotfiles/dot_zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
