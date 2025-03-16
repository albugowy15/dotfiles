#!/usr/bin/env zsh

in_tmux() {
    [[ -n "$TMUX" ]]
}

get_session_name() {
    local dirname=${PWD:t}
    echo ${dirname:gs/[^a-zA-Z0-9_]/_/:l}
}

main() {
    SESSION_NAME=$(get_session_name)
    
    if in_tmux; then
        nvim "$@"
        return 0
    fi
    
    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        tmux attach -t "$SESSION_NAME"
    else
        tmux new-session -s "$SESSION_NAME" -d
        if [[ $# -gt 0 ]]; then
            tmux send-keys -t "$SESSION_NAME" "cd '$PWD' && nvim $*" C-m
        else
            tmux send-keys -t "$SESSION_NAME" "cd '$PWD' && nvim" C-m
        fi
        tmux attach -t "$SESSION_NAME"
    fi
}

main "$@"
