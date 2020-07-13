#!/usr/bin/env bash

alias ip='echo $(curl ident.me -4 2>/dev/null)'
alias ipinfo='curl "ipinfo.io/"$(ip)'
alias getips='\egrep "\b(([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}(1[0-9][0-9]|2[0-4][0-9]|25[0-5]|[0-9]{1,2})\b"'
alias ping='prettyping -c 5 --nolegend'                   # Stop after sending count ECHO_REQUEST packets
alias fastping='ping -c 100 -i.2'                         # don't wait interval 1 second, go fast
alias speed-test="docker run --rm -it jariasl/speed-test" # via https://github.com/chrismetcalf/homedir/blob/fc7a9814a3513410b4bf4ec39e9e5bc6e62898e3/.zsh/rc/alias
