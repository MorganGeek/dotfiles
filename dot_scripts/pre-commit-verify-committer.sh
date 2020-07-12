#!/bin/bash
#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.

# shellcheck disable=SC1090
source "$HOME/.zsh_functions"
source "$HOME/.scripts/secrets.sh"

REMOTE=$(git config --get remote.origin.url)
USERNAME=$(git config --get user.name)
EMAIL=$(git config --get user.email)
checkEmailUsername() {
    if [[ "$EMAIL" != "$1" ]]; then
        warning "Invalid email: $EMAIL for remote $REMOTE"
        arrow "fix this by running :\ngit config user.email $1"
        exit 1
    fi
    if [[ "$USERNAME" != "$2" ]]; then
        warning "Invalid username: $USERNAME for remote $REMOTE"
        arrow "fix this by running :\ngit config user.name \"$2\""
        exit 1
    fi
}
if [[ $REMOTE == *"$COMPANY_NAME"* ]] && [[ "$REMOTE" != *"dotfiles"* ]]; then
    checkEmailUsername "$GIT_PRO_EMAIL" "$GIT_PRO_USER"
else
    checkEmailUsername "$GIT_PERSONAL_EMAIL" "$GIT_PERSONAL_USER"
fi
