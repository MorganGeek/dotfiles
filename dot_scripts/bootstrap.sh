# Make sure Code directory exists
mkdir -p ~/Code
ln -snf ~/Code/dotfiles/dot_scripts ~/.scripts
chmod +x ~/.scripts/*.sh

# Install missing package (Linux)
case "$(uname -s)" in
   Linux)
     echo 'Linux'
     sudo yum groupinstall 'Development Tools' -y
     sudo yum install git which zip unzip ruby curl file docker gcc make libxcrypt-compat vim-enhanced -y
     ;;
esac

# Install HomeBrew
case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
     ;;

   Linux)
     echo 'Linux'
     git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
     mkdir -p ~/.linuxbrew/bin
     ln -snf ../Homebrew/bin/brew ~/.linuxbrew/bin
     eval $(~/.linuxbrew/bin/brew shellenv)
     ;;
   *)
     echo 'Non supported OS'
     exit
     ;;
esac
# Prevent `Error: Your Homebrew is outdated. Please run `brew update`.`
brew update

# Create symbolic links
ln -snf ~/.local/share/chezmoi/ ~/dotfiles
ln -snf ~/Code/dotfiles/Brewfile ~/Brewfile
ln -snf ~/Code/dotfiles/Gemfile ~/Gemfile
ln -snf ~/Code/dotfiles/README.md ~/README.md
ln -snf ~/Code/dotfiles/dot_bash_profile ~/.bash_profile
ln -snf ~/Code/dotfiles/dot_gitconfig ~/.gitconfig
ln -snf ~/Code/dotfiles/dot_macos ~/.macos
ln -snf ~/Code/dotfiles/dot_scripts ~/.scripts
ln -snf ~/Code/dotfiles/dot_vimrc ~/.vimrc
ln -snf ~/Code/dotfiles/dot_zsh_aliases ~/.zsh_aliases
ln -snf ~/Code/dotfiles/dot_zsh_functions ~/.zsh_functions
ln -snf ~/Code/dotfiles/dot_zshrc ~/.zshrc
ln -snf ~/Code/dotfiles/dot_zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
ln -snf ~/Code/dotfiles/private_dot_ssh/config ~/.ssh/config
ln -snf ~/Code/dotfiles/requirements.txt ~/requirements.txt
ln -snf ~/Code/dotfiles/dot_surfraw.conf ~/.surfraw.conf

# Other symblinks + Install Docker Desktop for Mac
case "$(uname -s)" in
   Darwin)
     ln -snf ~/.config/Code/User/settings.json "~/Library/Application Support/Code/User/settings.json"
     ln -snf "~/Library/Mobile Documents/com~apple~CloudDocs/Mackup/Library/Application Support/Code/User/snippets" "~/Library/Application Support/Code/User/snippets"
     ln -snf "~/Library/Mobile Documents/com~apple~CloudDocs/Mackup/.mackup.cfg" ~/.mackup.cfg
     ~/.scripts/install_docker_for_mac.sh
     ;;
esac

# Install dependencies (apps, fonts, ...) with Brew
brew bundle

# Switch to ZSH
echo "$(which zsh)" >> /etc/shells
chsh -s "$(which zsh)"

# Use SDKMan to install development tools
curl -s "https://get.sdkman.io" | bash
sdk install java
sdk install gradle
sdk install java 8.0.222-zulu
sdk selfupdate

# Install Docker Desktop for Mac
case "$(uname -s)" in
   Linux)
     echo 'Install ruby on Linux'
     curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
     curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
     curl -L get.rvm.io | bash -s stable
     source /etc/profile.d/rvm.sh
     rvm reload
     rvm requirements run
     rvm install 2.3.7
     ;;
esac

# Install bundler for managing ruby dependencies and Gemfile
sudo gem install bundler
bundle install

# Install Oh My Zsh and some cool dependencies
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/AlexisBRENON/oh-my-zsh-reminder ~/.oh-my-zsh/custom/plugins/reminder
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ln -snf ~/Code/dotfiles/dot_zshrc ~/.zshrc
ln -snf ~/Code/dotfiles/dot_zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh

# Install no-more-secrets
git clone https://github.com/bartobri/no-more-secrets.git ~/Code/no-more-secrets
cd ~/Code/no-more-secrets
make nms sneakers
sudo make install
cd ~/

# OSX Defaults
case "$(uname -s)" in
   Darwin)
     sudo sh .macos
     ;;
esac

# Customize /etc/hosts
curl https://someonewhocares.org/hosts/hosts -o /etc/hosts

# Install NPM dependencies
npm install -g jira-node-cli --save

# Install pip and pipenv
sudo easy_install pip
sudo pip install --upgrade pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
case "$(uname -s)" in
   Darwin)
     ln -snf /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/pip pip3
     export PATH=$PATH:/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/
     ;;
esac
sudo pip install --upgrade pip
pip install -r requirements.txt

# was used for some slack cli in python... https://pypi.org/project/slack-cli/
# pip3 install pipenv
# pyenv install 3.6.0

# Upgrade
~/.scripts/upgrade.sh

# Reload
~/.scripts/reload.sh
