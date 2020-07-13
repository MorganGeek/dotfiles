#!/usr/bin/env bash
alias commit='gc'
alias gcls='git clone --depth 1 --recurse-submodules'
alias gpar='gitpushallremote'
alias gpcr='gitpushcurrentremote'
alias lg='lazygit'
alias neworigin='setorigin'
alias origin='setorigin'
alias goto='git go'
alias master='goto master'
alias develop='goto develop'
alias gg='git config -l | grip' # search git config for ...
alias ucommit='PRE_COMMIT_ALLOW_NO_CONFIG=1 git commit --no-verify'
