#!/usr/bin/env bash

# Get current tmux pane's working directory
if [[ -n "$TMUX" ]]; then
    dir=$(tmux display-message -p '#{session_path}')
else
    dir=$(pwd)
fi

# Normalize directory (remove trailing slash)
dir="${dir%/}"

# Find PDFs and select with fzf (display relative paths)
pdf=$(find "$dir" -maxdepth 3 -type f -name "*.pdf" 2>/dev/null | \
    sed "s|^$dir/||" | \
    fzf --prompt="PDF: " \
        --height=80% --margin 10% --color="bw" )

[[ -z "$pdf" ]] && exit 0

# Open with zathura
zathura "$dir/$pdf"
