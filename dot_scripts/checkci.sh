#!/usr/bin/env bash
function _checkci() {
    local username
    username="$(git config --global -l | grep "user.email" | cut -d'@' -f1 | cut -d'=' -f2)"
    local jenkinsfile="${1:-Jenkinsfile}"
    curl --user "$username:$JENKINS_SECRET" -X POST -F "jenkinsfile=<$jenkinsfile" "$JENKINS_URL/pipeline-model-converter/validate"
}
_checkci "$*"
exit 0
