
# Hush default login greeting
set -U fish_greeting ""

# Init oh-my-posh
oh-my-posh init fish --config ~/dotfiles/burtchell.simple.omp.json | source

# Get aliases
. ~/.config/fish/functions/aliases.fish