#!/usr/bin/env bash
echo "Creating symbolic links"

ln -snf "$HOME/Code/dotfiles/dot_profile" "$HOME/.profile"
ln -snf "$HOME/.local/share/chezmoi/" "$HOME/dotfiles"
ln -snf "$HOME/Code/dotfiles/Gemfile" "$HOME/Gemfile"
ln -snf "$HOME/Code/dotfiles/README.md" "$HOME/README.md"
ln -snf "$HOME/Code/dotfiles/dot_bash_profile" "$HOME/.bash_profile"
ln -snf "$HOME/Code/dotfiles/dot_gitconfig" "$HOME/.gitconfig"
ln -snf "$HOME/Code/dotfiles/dot_macos" "$HOME/.macos"
ln -snf "$HOME/Code/dotfiles/dot_scripts" "$HOME/.scripts"
ln -snf "$HOME/Code/dotfiles/dot_scripts/checkci.sh" /usr/local/bin/checkci
ln -snf "$HOME/Code/dotfiles/dot_scripts/git-overview.py" /usr/local/bin/git-overview # via https://github.com/qznc/dot/blob/master/bin/git-overview
ln -snf "$HOME/Code/dotfiles/dot_scripts/pre-commit-verify-committer.sh" /usr/local/bin/pre-commit-verify-committer
ln -snf "$HOME/Code/dotfiles/dot_vimrc" "$HOME/.vimrc"
# custom linters
ln -snf "$HOME/Code/dotfiles/dot_vim/ale_linters" "$HOME/.vim/ale_linters"
ln -snf "$HOME/Code/dotfiles/dot_aliases" "$HOME/.aliases"
ln -snf "$HOME/Code/dotfiles/dot_zsh_aliases" "$HOME/.zsh_aliases"
ln -snf "$HOME/Code/dotfiles/dot_zsh_functions" "$HOME/.zsh_functions"
ln -snf "$HOME/Code/dotfiles/dot_zshrc" "$HOME/.zshrc"
ln -snf "$HOME/Code/dotfiles/dot_zshrc.pre-oh-my-zsh" "$HOME/.zshrc.pre-oh-my-zsh"
ln -snf "$HOME/Code/dotfiles/private_dot_ssh/config" "$HOME/.ssh/config"
ln -snf "$HOME/Code/dotfiles/requirements.txt" "$HOME/requirements.txt"
ln -snf "$HOME/Code/dotfiles/dot_surfraw.conf" "$HOME/.surfraw.conf"
ln -snf "$HOME/Code/dotfiles/private_dot_3llo/config.sh" "$HOME/.3llo_config"
ln -snf "$HOME/Code/dotfiles/dot_ansiweatherrc" "$HOME/.ansiweatherrc"
ln -snf "$HOME/Code/dotfiles/dot_p10k.zsh" "$HOME/.p10k.zsh"
ln -snf "$HOME/Code/dotfiles/dot_git-template" "$HOME/.git-template"
ln -snf "$HOME/Code/dotfiles/private_dot_newsboat" "$HOME/.newsboat"
ln -snf "$HOME/Code/dotfiles/private_dot_config/Code" "$HOME/.config/Code"
ln -snf "$HOME/Code/dotfiles/private_dot_config/neofetch" "$HOME/.config/neofetch"
ln -snf "$HOME/Code/dotfiles/private_dot_config/gh" "$HOME/.config/gh"
ln -snf "$HOME/Code/dotfiles/private_dot_config/htop" "$HOME/.config/htop"
ln -snf "$HOME/Code/dotfiles/private_dot_config/bashtop" "$HOME/.config/bashtop"
ln -snf "$HOME/Code/dotfiles/private_dot_config/wtf" "$HOME/.config/wtf"
ln -snf "$HOME/Code/dotfiles/private_dot_config/yamllint" "$HOME/.config/yamllint"
ln -snf "$HOME/Code/dotfiles/dot_git-template/.pre-commit-config.yaml" "$HOME/dotfiles/.pre-commit-config.yaml"

# Aspell symbolic links
ln -snf "$HOME/Code/dotfiles/dot_aspell.en.prepl" "$HOME/.aspell.en.prepl"
ln -snf "$HOME/Code/dotfiles/dot_aspell.en.pws" "$HOME/.aspell.en.pws"
ln -snf "$HOME/Code/dotfiles/dot_aspell.fr.prepl" "$HOME/.aspell.fr.prepl"
ln -snf "$HOME/Code/dotfiles/dot_aspell.fr.pws" "$HOME/.aspell.fr.pws"

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
