#!/usr/bin/env bash

alias jirasearch='issues'
alias cicdlist="jira issue jql \"project = 'CICD' AND resolution = Unresolved\""
alias backlogs="jira issue jql \"status = New AND project IN (CICD) AND Created > -2w ORDER BY Priority DESC\""
alias bakclogs='backlogs'
alias support="jira issue jql \"project in (CICD) AND (Created > -2w AND resolution = Unresolved AND (type = 'Engineering Incident' AND status not in ('Waiting for external information') OR type IN ('Engineering Request', 'Task', 'User Story') AND status in ('New', 'To be picked next')) OR resolution != Unresolved AND status = 'In Progress') ORDER BY key DESC\""
alias guardian="support"
alias lastissues='jira issue jql "project IN (CICD) AND Created > -2w ORDER BY Created DESC, Priority DESC"'
alias workingon="jira issue jql \"assignee = currentUser() AND resolution = Unresolved AND status not in ('In Review', 'Done', 'In Testing', 'Waiting For Build') OR QA = currentUser() AND status = 'In Testing' ORDER BY updated DESC, priority DESC\""
alias toreview='jira issue jql "project in (CICD) AND Updated > -2w AND issue.property[development].openprs > 0 ORDER BY Created DESC, Priority ASC"'
alias newissues="jira issue jql \"project IN (CICD) AND Created > -2w AND resolution = Unresolved AND status not in ('In Progress') ORDER BY Created DESC, Priority DESC\""
alias n='newissues'
alias backlog=cicdlist
alias bakclog='backlog'
alias b='backlog'
alias mybacklog="jira issue ls && asana && confluencetasks && trello_web"
alias mb='mybacklog'
alias myissues='mb'
alias me='mb'
alias j='jira issue open'
alias trello='3llo'
alias work='moro'
