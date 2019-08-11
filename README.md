## Prerequisites

### Centos
`yum install git which zip unzip ruby -y`

## Setup
```
git clone ssh://git@bitbucket.collibra.com/~morgan.wattiez/dotfiles.git ~/Code/dotfiles
~/Code/dotfiles/dot_scripts/bootstrap.sh
```

### Run
run `.scripts/bootstrap.sh`

### Reload
run `zsh .scripts/reload.sh`

### Upgrade
run `zsh .scripts/upgrade.sh`

### Scope
* Use SDKMan to install development tools
* Install Docker Desktop for Mac
* Install asciidoctor-pdf
* Install Oh My Zsh and some cool dependencies
* OSX Defaults
* Install NPM dependencies
* Install pip and pipenv
* Install AWS-CLI

### If Yubico is installed, run this :
`sudo ansible-playbook ~/Code/dotfiles/macsecure_playbook.yaml`

#### In cases of `\n` errors with zsh
https://github.com/robbyrussell/oh-my-zsh/issues/6764#issuecomment-384045008
```
cd $ZSH
git config core.autocrlf false
git rm --cached -r .
git reset --hard
```
