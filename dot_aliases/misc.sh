#!/usr/bin/env bash

# Misc
alias adhoc="ansible --one-line 127.0.0.1 -m"
alias ans='adhoc'
alias bash="/usr/local/bin/bash"
#alias date="gdate"
alias away='moro break 10 && coffee'
alias afk='away'

# Protect the / directory - via https://github.com/JanEbbing/mytoolbox/blob/5440831fbd0d1575e595d931d4d35be187cf736e/.bash_aliases
alias chown='gchown --preserve-root'
alias chmod='gchmod --preserve-root'
alias chgrp='gchgrp --preserve-root'
alias current_year='`echo date +"%Y"`'
alias ftk='file_to_kindle'
alias send_to_kindle='file_to_kindle'
alias stk='send_to_kindle'
alias tokindle='file_to_kindle'
alias kindle='to_kindle'
alias headers='curl -I --compress'        # Find out if remote server supports gzip / mod_deflate or not #
alias https='http --default-scheme=https' # useful alias stealed from a colleague. http is provided by httpie
alias path='echo -e ${PATH//:/\\n}'       # Explode and display current PATH
alias p='ps -ef | grip '                  # Show matching processes. Usage : p <process name>
alias root='sudo -i'
alias ':q'='exit'
alias current_hour='date +"%H:%M"'
alias current_time='current_hour'
# FIXME : register the alias only if browser is Chrome based (Google Chrome/Brave/etc)
alias meditate='browse chrome-extension://onjcfgnjjbnflacfbnjaapcbiecckilk/popup.html#fullscreen'
alias runhooks='pre-commit run -a'
# https://unix.stackexchange.com/a/205854/220566
alias trim='awk "{\$1=\$1};1"'
alias trem="awk '{\$1=\$1};1'"
# via https://github.com/richinfante/dotfiles/blob/0e1df2d833257e3a3ca2e4fcc8f2f128d52b5d29/dotfiles/.profile_setup/30-aliases.sh
alias lowercase='tr "[[:upper:]]" "[[:lower:]]"'
alias uppercase='tr "[[:lower:]]" "[[:upper:]]"'
alias to_lower='lowercase'
alias to_upper='uppercase'
alias tryhook='pre-commit try-repo .'
alias whatyear='current_year'
alias whathour='current_time'
alias whattime='whathour'
