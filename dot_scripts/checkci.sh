#!/usr/bin/env bash
###
### checkci — checks a Jenkinsfile syntax against a real Jenkins instance
###
### Note: this script gets:
###   the (jenkins) username from git config
###   the (jenkins) password/secret from Environment variable $JENKINS_SECRET
###   the (jenkins) URL from Environment variable $JENKINS_URL
###
### Usage:
###   checkci.sh [jenkinsfile]
###
### Options:
###   [input]   path to Jenkinsfile (optional).
###   -h        Show this message.

help() {
    gsed -rn 's/^### ?//;T;p' "$0"
}

if [[ $# == 0 ]] || [[ "$1" == "-h" ]]; then
    help
    exit 1
fi

function _checkci() {
    local username
    username="$(git config --global -l G "user.email" | cut -d'@' -f1 | cut -d'=' -f2)"
    local jenkinsfile="${1:-Jenkinsfile}"
    curl --user "$username:$JENKINS_SECRET" -X POST -F "jenkinsfile=<$jenkinsfile" "$JENKINS_URL/pipeline-model-converter/validate"
}
_checkci "$*"
exit 0
