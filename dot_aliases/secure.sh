#!/usr/bin/env bash

alias mgmt='ssh $(whoami)@$PROXY_HOST -i $HOME/.ssh/id_ed25519'
alias m='mgmt'
alias tunnel='ssh -D 8000 -N $(whoami)@$PROXY_HOST -i $HOME/.ssh/id_ed25519'
alias sshpub='cat $HOME/.ssh/id_ed25519.pub'
alias ssla="openssl x509 -alias -noout -in" # Usage : ssla <cert>
alias encrypt='ansible-vault encrypt **/vault.yml --vault-password-file=$VAULT_PASSWORD_FILE'
alias decrypt='ansible-vault decrypt **/vault.yml --vault-password-file=$VAULT_PASSWORD_FILE'
alias bitwarden-cli='bw'
alias newpass='bw generate --special --uppercase --lowercase --number --length 30'
