### Use SDKMan to install development tools
```
curl -s "https://get.sdkman.io" | bash
sdk install java
sdk install gradle
sdk install java 8.0.202-zulu
```

### Install Docker Desktop for Mac
```
~/.scripts/bootstrap.sh
```

### Install dependencies (apps, fonts, ...) with Brew
`brew bundle`

#### Enable Sleepwatcher 
`brew services start sleepwatcher`
`/usr/local/sbin/sleepwatcher --resume ~/.scripts/resume.sh`

### Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9
git clone https://github.com/AlexisBRENON/oh-my-zsh-reminder ~/.oh-my-zsh/custom/plugins/reminder
```

### OSX Defaults
```
defaults write http://com.apple .screencapture location ~/Downloads
#defaults write com.apple.PowerChime ChimeOnNoHardware -bool true # still KO after closing lid
#killall PowerChime
```

### Install NPM dependencies
`npm install -g jira-node-cli`

### Install pip
```
sudo easy_install pip
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
```

### Install AWS-CLI
```
pip3 install boto3
pip3 install awscli
```
