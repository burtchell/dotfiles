#!/usr/bin/env bash

cd $(tmux display -p -F "#{pane_current_path}")
url=$(git remote get-url origin)

if [[ $url == *github.com* ]]; then
    if [[ $url == git@* ]]; then
        url="${url#git@}"
        url="${url/:/\/}" 
        url="https://$url"
    fi

    echo "$url"
    if command -v explorer.exe >/dev/null 2>&1
    then
      explorer.exe "$url"  # WSL-compatible
    else
      open "$url"
    fi
else
    echo "This repository is not hosted on GitHub"
fi
