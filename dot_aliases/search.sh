#!/usr/bin/env bash

alias ddg='ddgr'
alias goo='googler'
alias se='sr -elvi'
alias eg='env | grip' # search env variables for pattern
alias engines='sr -elvi'
alias grep='rg'
alias grip='grep -i'
alias usernames="python3 $HOME/Code/sherlock/sherlock.py --rank --print-found"
alias ygg="torrengo -s ygg"
alias ag='alias | grip'   # search for patten among aliases
alias hg='history | grip' # search for pattern among history
alias hist='history'
alias codestats='tokei'
alias dups='file_dups'
alias pairs='file_getpairs'
alias filter_pairs="tr '[:upper:]' '[:lower:]' | \grep -o -E '\w{3,} \w{3,}' | \grep --invert-match --word-regexp --fixed-strings --file=\"\$HOME/stopwords.txt\" | \sed 's/s$//g' | \sed 's/ing$//g' | sort | uniq -c | sort --numeric-sort --reverse"
alias sort_count="sort | uniq -c | sort --numeric-sort --reverse"
alias words='file_getwords'
alias fd="\fd"
alias wiki='wikit'
alias dico='dict'
