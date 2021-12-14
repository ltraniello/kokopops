_kops_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="deploy commands test"

    if [ "$prev" == "kops" ]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    elif [ "$prev" == "deploy" ] | [ "$prev" == "test" ]; then
        COMPREPLY=( $(compgen -W "$(kops commands)" -- ${cur}) )
        return 0
    fi

}

complete -F _kops_completions kops
