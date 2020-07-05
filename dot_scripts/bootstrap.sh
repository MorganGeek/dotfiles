#!/usr/bin/env bash
# Make sure Code directory exists

echo "Hello $(whoami)! Let's get you set up."

echo "create vim directory is missing"
mkdir -vp "$HOME/.vim"

echo "mkdir -p $HOME/Code"
mkdir -p ~/Code
ln -snf ~/Code/dotfiles/dot_scripts ~/.scripts
ln -snf ~/Code/dotfiles/dot_gitconfig ~/.gitconfig
chmod +x ~/.scripts/*.sh

if [[ $(uname) == "Linux" ]]; then
    IS_LINUX=true
else
    IS_LINUX=false
fi

if [[ $(uname) == "Darwin" ]]; then
    IS_MAC=true
else
    IS_MAC=false
fi

# Install missing package (Linux)
function installLinuxPackages() {
    if [ "$IS_LINUX" = true ]; then
        echo "(Linux) Installing Development Tools"
        yum install sudo -y
        sudo yum groupinstall 'Development Tools' -y
        sudo yum install git which zip unzip ruby curl file docker gcc make libxcrypt-compat vim-enhanced -y
    fi
}

# Install HomeBrew
function installBrew() {
    if [ "$IS_MAC" = true ]; then
        echo "(Mac OS X) installing homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        # Prevent `Error: Your Homebrew is outdated. Please run `brew update`.`
        echo "Updating Homebrew"
        brew update
        # Path to ruby
        export PATH="/usr/local/opt/ruby/bin:$PATH"
    fi
}

# Create symbolic links
function createSymbolicLinks() {
    echo "Creating symbolic links"
    ln -snf ~/Code/dotfiles/dot_profile ~/.profile
    ln -snf ~/.local/share/chezmoi/ ~/dotfiles
    ln -snf ~/Code/dotfiles/Gemfile ~/Gemfile
    ln -snf ~/Code/dotfiles/README.md ~/README.md
    ln -snf ~/Code/dotfiles/dot_bash_profile ~/.bash_profile
    ln -snf ~/Code/dotfiles/dot_macos ~/.macos
    ln -snf ~/Code/dotfiles/dot_scripts/checkci.sh /usr/local/bin/checkci
    ln -snf ~/Code/dotfiles/dot_vimrc ~/.vimrc
    ln -snf ~/Code/dotfiles/dot_vim/ale_linters ~/.vim/ale_linters # custom linters
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
}

# Install dependencies (apps, fonts, ...) with Brew
function installMacSoftware() {
    if [ "$IS_MAC" = true ]; then
        echo "(Mac OS X) Installing Docker"
        ~/.scripts/install_docker_for_mac.sh
	    echo "(Mac OS X) Brew installing stuff (apps, fonts, ...)"
	    ln -snf ~/Code/dotfiles/Brewfile ~/Brewfile
	    brew bundle
        # Configure Mac specific symbolic links
        echo "(Mac OS X) Adding symbolic links"
        mkdir -pv "$HOME/Library/Application Support/Code/User/snippets"
        ln -snf "$HOME/.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
        ln -snf "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Mackup/Library/Application Support/Code/User/snippets" "$HOME/Library/Application Support/Code/User/snippets"
        ln -snf "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Mackup/.mackup.cfg" "$HOME/.mackup.cfg"
    fi
}

# Install dependencies (apps, fonts, ...) for CentOS
function installLinuxSoftware() {
    if [ "$IS_LINUX" = true ]; then
        echo "(CentOS) Installing stuff (apps, ...)"
        chmod +x ~/Code/dotfiles/centos.sh
        ~/Code/dotfiles/centos.sh
    fi
}

# Switch to ZSH
function switchToZsh() {
    sudo -v
    echo "switching to ZSH"
    command -v zsh >>/etc/shells
    chsh -s "$(command -v zsh)"
}

# Use SDKMan to install development tools
function installSDKMan() {
    echo "Installing SDKMan as development tools manager"
    curl -s "https://get.sdkman.io" | bash

    echo "SDKMan installing development tools"
    sdk install java
    sdk install gradle
    sdk install java 8.0.222-zulu
    sdk install kotlin
    echo "SDKMan updating"
    sdk selfupdate
}
function installRubyOnLinux() {
    if [ "$IS_LINUX" = true ]; then
        echo '(Linux) Installing ruby'
        curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
        curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
        curl -L get.rvm.io | bash -s stable
        source /etc/profile.d/rvm.sh
        rvm reload
        rvm requirements run
        rvm install 2.3.7
    fi
}

# Install bundler for managing ruby dependencies and Gemfile
function installBundler() {
    echo "Installing bundler for managing ruby dependencies and Gemfile"
    sudo gem install bundler
    bundle install
}

# Install Oh My Zsh and some cool dependencies
function installOhMyZsh() {
    echo "Installing Oh My Zsh + customizing themes and plugins"
    echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' ~/.zshrc >>!
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/AlexisBRENON/oh-my-zsh-reminder "$ZSH_CUSTOM/plugins/reminder"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    ln -snf ~/Code/dotfiles/dot_zshrc ~/.zshrc
    ln -snf ~/Code/dotfiles/dot_zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
}
function installVimPlugins() {
    echo "Installing Vundle + VIM Plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall >/dev/null
    #https://github.com/ycm-core/YouCompleteMe/blob/master/README.md#installation
    cd "$HOME/.vim/bundle/YouCompleteMe" || exit
    ./install.py --all
    cd "$HOME" || exit
    git clone https://github.com/dbeniamine/cheat.sh-vim.git ~/.vim/cheat.sh-vim
}
# Install no-more-secrets
function installNoMoreSecrets() {
    echo "Installing no-more-secrets (for fun)"
    git clone https://github.com/bartobri/no-more-secrets.git ~/Code/no-more-secrets
    cd "$HOME/Code/no-more-secrets" || exit
    make nms sneakers
    sudo make install
    cd "$HOME" || exit
}

# OSX Defaults
function overrideMacOsDefaults() {
    if [ "$IS_MAC" = true ]; then
        echo "(Mac OS X) Loading preferences"
        sudo sh .macos
    fi
}

# Customize /etc/hosts
function overrideEtcHosts() {
    echo "Overriding /etc/hosts"
    curl https://someonewhocares.org/hosts/hosts -o /etc/hosts
}

function installSoftware() {
    # Install pip and pipenv
    echo "Installing pip and pipenv"
    sudo easy_install pip
    sudo pip install --upgrade pip
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    sudo python3 get-pip.py
    if [ "$IS_MAC" = true ]; then
        echo "(Mac OS X) Updating PATH for loading pip user installed packages"
        ln -snf /usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/bin/pip pip3
        export PATH="$PATH:/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/:/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/bin:/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/bin"
    fi

    echo "Upgrading pip"
    sudo pip install --upgrade pip
    echo "Pip installing stuff"
    pip install -r requirements.txt

    # was used for some slack cli in python... https://pypi.org/project/slack-cli/
    # pip3 install pipenv
    # pyenv install 3.6.0

    # Install baton (CLI to manage Spotify playback) https://github.com/joshuathompson/baton
    case "$(uname -s)" in
    Darwin)
        echo '(Mac OS X) Installing baton (spotify CLI)'
        curl -sSL https://github.com/joshuathompson/baton/releases/download/0.1.7/baton-0.1.7-darwin-amd64 -o /usr/local/bin/baton && chmod +x /usr/local/bin/baton
        ;;

    Linux)
        echo '(Linux) Installing baton (spotify CLI)'
        curl -sSL https://github.com/joshuathompson/baton/releases/download/0.1.7/baton-0.1.7-linux-amd64 -o /usr/local/bin/baton && chmod +x /usr/local/bin/baton
        ;;
    *)
        echo 'Non supported OS : Installation aborted for baton (spotify CLI)'
        exit
        ;;
    esac

    # Use rustup to install the Rust compiler (rustc) and the Rust package manager (cargo).
    echo "Installing Rust compiler and package manager"
    rustup-init -y
    rustup component add rustfmt
    # Install pa11y tool for local webpage accessibility analysis
    echo "Installing pa11y tool for local webpage accessibility analysis"
    npm install -g pa11y

    git clone https://github.com/sherlock-project/sherlock.git ~/Code/sherlock
    cd sherlock || exit
    python3 -m pip install -r requirements.txt

    git config --global init.templateDir ~/.git-template
    pre-commit init-templatedir ~/.git-template

    terraform-docs completion zsh >/usr/local/share/zsh/site-functions/_terraform-docs
    autoload -U compinit && compinit

    go get -u -v github.com/jessfraz/dockfmt
    go get -u -v github.com/dmlittle/scenery
    go get -u -v github.com/camptocamp/terraboard

    sudo curl -L git.io/scope -o /usr/local/bin/scope
    sudo chmod a+x /usr/local/bin/scope
}

# Upgrade
function upgradeSoftware() {
    echo "Upgrading apps"
    ~/.scripts/upgrade.sh
}


# Reload
function reloadConfig() {
    echo "Reloading config"
    ~/.scripts/reload.sh
}

function doIt() {
    installLinuxPackages;
    installBrew;
    createSymbolicLinks;
    installMacSoftware;
    installLinuxSoftware;
    switchToZsh;
    installSDKMan;
    installRubyOnLinux;
    installBundler;
    installOhMyZsh;
    installVimPlugins;
    installNoMoreSecrets;
    overrideMacOsDefaults;
    overrideEtcHosts;
    installSoftware;
    upgradeSoftware;
    reloadConfig;
}

doIt;
