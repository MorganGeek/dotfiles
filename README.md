### Use SDKMan to install development tools
```
curl -s "https://get.sdkman.io" | bash
sdk install java
sdk install gradle
sdk install java 8.0.202-zulu
```

### Install Docker Desktop for Mac
```
docker_app=$(find /Applications/ \
                  -name "Docker.app" -maxdepth 1 -mindepth 1 -type d)
if [ -z "$docker_app" ]; then
   curl -o ~/Downloads/Docker.dmg -sL https://download.docker.com/mac/stable/Docker.dmg
   hdiutil verify ~/Downloads/Docker.dmg
   hdiutil attach ~/Downloads/Docker.dmg -nobrowse
   cp -R /Volumes/Docker/Docker.app /Applications/
   hdiutil detach /Volumes/Docker
   rm ~/Downloads/Docker.dmg
   sudo /Applications/Docker.app/Contents/MacOS/Docker --quit-after-install --unattended
else
   echo "Docker for Mac is already installed."
fi
```

### Install dependencies with Brew
`brew bundle`

### Install Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9
gsed  's#ZSH_THEME="robbyrussell"#ZSH_THEME="powerlevel9k/powerlevel9k"#g' -i ~/.zshrc
```

### install Meslo font
Get it from `https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf` and configure it as default in iTerm2 Set this font in iTerm2 (14px is my personal preference) (iTerm → Preferences → Profiles → Text → Change Font).

### OSX Defaults
```
defaults write http://com.apple .screencapture location ~/Downloads
#defaults write com.apple.PowerChime ChimeOnNoHardware -bool true # still KO after closing lid
#killall PowerChime
```

### Install NPM dependencies
`npm install -g jira-node-cli`
