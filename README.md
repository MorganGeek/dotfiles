### Use SDKMan to install development tools
```
curl -s "https://get.sdkman.io" | bash
sdk install java
sdk install gradle
sdk install java 8.0.202-zulu
```

### Install Docker Desktop for Mac
```
~/.scripts/executable_bootstrap.sh
```

### Install dependencies (apps, fonts, ...) with Brew
`brew bundle`

### Install asciidoctor-pdf
`sudo gem install -n /usr/local/bin asciidoctor-pdf --pre`

### Install Oh My Zsh and some cool dependencies
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9
git clone https://github.com/AlexisBRENON/oh-my-zsh-reminder ~/.oh-my-zsh/custom/plugins/reminder
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
#### In order to upgrade it, just run
`upgrade_oh_my_zsh`

### In cases of `\n` errors with zsh
https://github.com/robbyrussell/oh-my-zsh/issues/6764#issuecomment-384045008
```
cd $ZSH
git config core.autocrlf false
git rm --cached -r .
git reset --hard
```

### OSX Defaults
```
sudo sh .macos
```

### Install NPM dependencies
`npm install -g jira-node-cli`

### Install pip and pipenv
```
sudo easy_install pip
sudo pip install --upgrade pip

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install --upgrade pip
ln -s /usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/pip pip3
export PATH=$PATH:/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/
pip3 install pipenv
```

### Install AWS-CLI
```
pip3 install boto3
pip3 install awscli
```

### If Yubico is installed, run this :
`sudo ansible-playbook ~/Code/dotfiles/macsecure_playbook.yaml`

## Upgrades

### Upgrade dependencies with Brew
`brew outdated | xargs brew upgrade`

