#!/usr/bin/env bash

dir=$(tmux display -p -F "#{pane_current_path}")
cd "$dir"

if command -v explorer.exe >/dev/null 2>&1; then
  explorer.exe "$(wslpath -w "$dir")"  # WSL-compatible
else
  open "$dir"
fi
