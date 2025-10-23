#!/usr/bin/env bash

DIR_FILE="$HOME/.config/tmux/dirs.txt"
DEFAULT_DIRS=($HOME/ $HOME/.config/ $HOME/dev/*/)
dir_list=()

# expand globs from a line
expand_line() {
    local line="$1"
    local expanded=( )
    eval "expanded=($line)"
    for d in "${expanded[@]}"; do
        [[ -d "$d" ]] && dir_list+=("$d")
    done
}

if [[ -f "$DIR_FILE" ]]; then
    while IFS= read -r line; do
        [[ -n "$line" ]] && expand_line "$line"
    done < "$DIR_FILE"
else
    for d in "${DEFAULT_DIRS[@]}"; do
        [[ -d "$d" ]] && dir_list+=("$d")
    done
fi

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(printf "%s\n" "${dir_list[@]}" \
        | sed "s|^$HOME/|~/|" \
        | sk --margin 5% --color="bw")

    [[ -n "$selected" ]] && selected="${selected/#\~/$HOME}"  # convert ~ back to $HOME
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
if [[ "$selected_name" == "$(whoami)" ]]; then
    selected_name="home"
fi

if ! tmux has-session -t "$selected_name"; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"

