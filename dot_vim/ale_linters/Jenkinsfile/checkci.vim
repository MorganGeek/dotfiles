call ale#linter#Define('Jenkinsfile', {
\   'name': 'checkci',
\   'executable': 'checkci',
\   'command': 'checkci',
\   'callback': 'ale_linters#Jenkinsfile#checkci#HandleJenkinsValidator',
\})

function! ale_linters#Jenkinsfile#checkci#HandleJenkinsValidator(buffer, lines) abort
    " Regular expression to match messages:
    " They look like:
    " <file>:<line>:<col>: <code> <detailed text>
    " WorkflowScript: 7: Expected a step @ line 7, column 17.
    "let l:pattern = '\v^[a-zA-Z]?:?[^:]+:(\d+):?(\d+)?: \[?([[:alnum:]]+)\]? (.*)$'
    let l:pattern = '\v^WorkflowScript: (\d+): (.*) \@ line (\d+), column (\d+)\.(\_.*)$'

    " For each match, update the l:output list:
    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:code = l:match[5]

        call add(l:output, {
        \   'lnum': l:match[3] + 0,
        \   'col': l:match[4] + 0,
        \   'text': l:code . ': ' . l:match[2],
        \})
    endfor

    return l:output
endfunction
