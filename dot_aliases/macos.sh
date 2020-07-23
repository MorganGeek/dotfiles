#!/usr/bin/env bash
# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend" # Lock the screen (when going AFK)
alias lastlogin="log show --style syslog  --last 1d | awk '/Enter/ && /unlockUIBecomesActive/ {print \$1 \" \" \$2}'"
alias loginhistory='lastlogin'
# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv $HOME/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 $HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
# via https://github.com/richinfante/dotfiles/blob/0e1df2d833257e3a3ca2e4fcc8f2f128d52b5d29/dotfiles/.profile_setup/30-aliases.sh
alias finder="open ."
alias cls="clear; printf '\e[3J'"
# Sound management
alias mute_headset='mute_device "Plantronics BT600"'
alias mute_speakers='mute_device "Haut-parleurs MacBook Pro"'
alias switch_headset='mute_speakers && switch_device "Plantronics BT600"'
alias switch_speakers='mute_headset && switch_device "Haut-parleurs MacBook Pro"'
# Meeting management
alias zoom="switch_headset && open -na 'zoom.us'"
alias nozoom="pkill 'zoom.us' && success 'zoom has been stopped'"
alias zoom30='zoomtimeboxed 30'
alias zoom60='zoomtimeboxed 60'
alias unmute='osascript -e "set volume without output muted"'
