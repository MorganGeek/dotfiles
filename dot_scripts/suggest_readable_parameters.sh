#!/usr/bin/env bash
function suggest_readable_parameters() {
    while read -r command_name; do
        arrow "searching for usage of $command_name"

        if [[ $(top_commands_full "\b$command_name\b" 50 &>/dev/null | wc -l | trim) -gt 30 ]]; then
            # arrow "$command_name appears frequently in your history"

            # FIXME : skip false positives like file -> "$file"
            # FIXME : skip false positives like parameter found "-" in sort --key 4 --numeric-sort --reverse
            # TODO : bring support for shell functions aliased to anything providing a real manual
            # e.g : checkov should be taken into account but github should not
            # TODO : bring support for backslashed functions (e.g : \egrep)
            # TODO : support research of command usage when parameters of command appear after command arguments, like : path_swilgt=$(find /usr/local/Cellar/logtalk -name "*swilgt.sh"dev/null)
            # TODO : support sub commands like in git ls-tree where ls-tree is a subcommand with its own manual : git ls-tree -r --long

            if [[ $(LC_ALL=C type "$command_name") != *"alias for"* && $(LC_ALL=C type "$command_name") != *"is a shell function"* ]] && [[ $($command_name --help &>/dev/null) -eq 0 || $(info $command_name &>/dev/null) -eq 0 ]]; then
                while read -r command_usage; do
                    arrow "searching for parameters in: $command_usage "
                    echo "$command_usage" | \grep -Eo "\b$command_name\b (\-[a-zA-Z0-9]*)" | head -1 | tr -d '-' | awk -v COUNT=1 'NF=COUNT' 1>/dev/null
                    if [ $? -eq 0 ]; then
                        while read -r command_parameters; do
                            success "($command_name) -> found parameters : $command_parameters"
                            while read -r parameter_name; do
                                echo "($command_name $command_parameters) -> check more readable alternative to $parameter_name"
                                $command_name --help 2>/dev/null | \egrep -wo "(\-$parameter_name), --.*" 1>/dev/null # | \grep "\-$parameter_name"
                                local provides_help=$?
                                info $command_name 2>/dev/null | \egrep -wo "(\-$parameter_name), --.*" 1>/dev/null # | \grep "\-$parameter_name"
                                local provides_manual=$?

                                if [ "$provides_help" -eq 0 ]; then
                                    success "($command_name -$parameter_name) -> found better alternative to $parameter_name in $command_usage:"
                                    $command_name --help | \egrep -wo "(\-$parameter_name), --.*"
                                fi
                                if [ "$provides_manual" -eq 0 ]; then
                                    success "($command_name -$parameter_name) -> found better alternative to $parameter_name in $command_usage:"
                                    info $command_name 2>/dev/null | \egrep -wo "(\-$parameter_name), --.*"
                                fi
                            done < <(echo "$command_parameters" | head -1 | tr -d '-' | fold -w 1)
                        done < <(echo "$command_usage" | \grep -Po "(?<=\b$command_name\b )(\-[a-zA-Z0-9]*)" | sort -u) #| head -1 | tr -d '-' | fold -w 1)
                    fi
                done < <(grep -H -n "\b$command_name\b" "$@")
            else
                #error "$command_name is not a valid command or does not provide a manual"
                true
            fi
        fi
    done < <(top_commands "" 1000 | awk '{print $4}' | grep "^[\\\\]?[a-z]+$" | sort -u)
}
