# Use SDKMan to install development tools
curl -s "https://get.sdkman.io" | bash
sdk install java
sdk install gradle
sdk install java 8.0.202-zulu

# Install Docker Desktop for Mac
~/.scripts/executable_bootstrap.sh

# Install dependencies (apps, fonts, ...) with Brew
brew bundle

# Install bundler for managing ruby dependencies and Gemfile
sudo gem install bundler

# Install Oh My Zsh and some cool dependencies
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9
git clone https://github.com/AlexisBRENON/oh-my-zsh-reminder ~/.oh-my-zsh/custom/plugins/reminder
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# OSX Defaults
sudo sh .macos

# Install NPM dependencies
npm install -g jira-node-cli --save

# Install pip and pipenv
sudo easy_install pip
sudo pip install --upgrade pip

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install --upgrade pip
ln -s /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/pip pip3
export PATH=$PATH:/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/
pip3 install pipenv

# Install AWS-CLI
pip3 install boto3
pip3 install awscli

# Upgrade
upgrade.sh

# Reload
reload.sh
