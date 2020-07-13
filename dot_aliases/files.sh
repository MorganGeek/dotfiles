#!/usr/bin/env bash
alias biggerthan10='biggerthan 10M'
alias c='cat'
alias h='cd $HOME'
alias cp='cp -i' # confirmation before overwrite #
alias del='rm -rf'
alias mv='mv -i' # confirmation before overwrite
alias mkcd='take'
alias rm='gomi'
alias df='df -H'
alias diff='colordiff --side-by-side --ignore-space-change --width=200 --suppress-common-lines  --recursive'
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
alias ctrl-c='pbcopy'
alias s=ls
alias sl=ll
alias ls='lsd'
alias lsg='ll | grip'     # show me files matching "ls grep"
alias lh='ls -alt | head' # see the last modified files
alias tree='ls --almost-all --tree -I .git'
alias x='extract'

# Projects shortcuts
alias code='cd $HOME/Code'
alias blog='z morgangeek-blog'

# Dotfiles
alias cm='chezmoi'
alias dots='cd $HOME/Code/dotfiles'
alias dotfiles='dots'
alias gochezmoi='cd $HOME/.local/share/chezmoi'

# Viewing files
alias cat='bat --style=plain --color "always"'
alias preview="fzf --preview 'bat --color \"always\" --style=plain {}' --cycle "
alias markdown2='pandoc README.md | lynx -stdin -dump'
alias markdown='glow'
alias v=vi
alias ve='vim $HOME/.vimrc'         # vimrc editing
alias ze='vim $HOME/.zshrc'         # zsh profile editing
alias zf='vim $HOME/.zsh_functions' # edit zsh_functions
alias za='vim $HOME/.zsh_aliases'   # edit zsh_aliases
