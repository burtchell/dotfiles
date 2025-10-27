#!/usr/bin/env bash

dir=$(tmux display -p -F "#{pane_current_path}")
cd "$dir"
url=$(. ~/.config/scripts/get-github-url.sh)

if [[ ! -z $url ]]; then
    echo "$url"
    if command -v explorer.exe >/dev/null 2>&1; then
      explorer.exe "$url"  # WSL-compatible
    else
      open "$url"
    fi
else
    echo "No github URL found at ${dir}"
fi
