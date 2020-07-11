#!/usr/bin/env bash
echo "Creating symbolic links"

ln -snf ~/Code/dotfiles/dot_profile ~/.profile
ln -snf ~/.local/share/chezmoi/ ~/dotfiles
ln -snf ~/Code/dotfiles/Gemfile ~/Gemfile
ln -snf ~/Code/dotfiles/README.md ~/README.md
ln -snf ~/Code/dotfiles/dot_bash_profile ~/.bash_profile
ln -snf ~/Code/dotfiles/dot_gitconfig ~/.gitconfig
ln -snf ~/Code/dotfiles/dot_macos ~/.macos
ln -snf ~/Code/dotfiles/dot_scripts ~/.scripts
ln -snf ~/Code/dotfiles/dot_scripts/checkci.sh /usr/local/bin/checkci
ln -snf ~/Code/dotfiles/dot_vimrc ~/.vimrc
# custom linters
ln -snf ~/Code/dotfiles/dot_vim/ale_linters ~/.vim/ale_linters
ln -snf ~/Code/dotfiles/dot_aliases ~/.aliases
ln -snf ~/Code/dotfiles/dot_zsh_aliases ~/.zsh_aliases
ln -snf ~/Code/dotfiles/dot_zsh_functions ~/.zsh_functions
ln -snf ~/Code/dotfiles/dot_zshrc ~/.zshrc
ln -snf ~/Code/dotfiles/dot_zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
ln -snf ~/Code/dotfiles/private_dot_ssh/config ~/.ssh/config
ln -snf ~/Code/dotfiles/requirements.txt ~/requirements.txt
ln -snf ~/Code/dotfiles/dot_surfraw.conf ~/.surfraw.conf
ln -snf ~/Code/dotfiles/private_dot_3llo/config.sh ~/.3llo_config
ln -snf ~/Code/dotfiles/dot_ansiweatherrc ~/.ansiweatherrc
ln -snf ~/Code/dotfiles/dot_p10k.zsh ~/.p10k.zsh
ln -snf ~/Code/dotfiles/dot_git-template ~/.git-template
ln -snf ~/Code/dotfiles/private_dot_newsboat ~/.newsboat
ln -snf ~/Code/dotfiles/private_dot_config/Code ~/.config/Code
ln -snf ~/Code/dotfiles/private_dot_config/neofetch ~/.config/neofetch
ln -snf ~/Code/dotfiles/private_dot_config/gh ~/.config/gh
ln -snf ~/Code/dotfiles/private_dot_config/htop ~/.config/htop
ln -snf ~/Code/dotfiles/private_dot_config/bashtop ~/.config/bashtop
ln -snf ~/Code/dotfiles/private_dot_config/wtf ~/.config/wtf
ln -snf ~/Code/dotfiles/private_dot_config/yamllint ~/.config/yamllint
ln -snf ~/Code/dotfiles/dot_git-template/.pre-commit-config.yaml ~/Code/dotfiles/.pre-commit-config.yaml

# Other symbolic links + Install Docker Desktop for Mac
case "$(uname -s)" in
    Darwin)
        echo "(Mac OS X) Adding symbolic links"
        ln -snf "$HOME/.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
        ln -snf "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Mackup/Library/Application Support/Code/User/snippets" "$HOME/Library/Application Support/Code/User/snippets"
        ln -snf "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Mackup/.mackup.cfg" "$HOME/.mackup.cfg"
        echo "(Mac OS X) Installing Docker"
        ~/.scripts/install_docker_for_mac.sh
        ;;
esac
