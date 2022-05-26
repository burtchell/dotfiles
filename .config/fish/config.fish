
# Hush default login greeting
set -U fish_greeting ""

# Init oh-my-posh
oh-my-posh init fish --config ~/dotfiles/burtchell.simple.omp.json | source

# Get aliases
. ~/.config/fish/functions/aliases.fish

[ -r ~/.extra ] && [ -f ~/.extra ] && bash ~/.extra

# run neofetch on start
neofetch

# force arrow key word movement in terminal (gnome terminal interferes)
bind \e\[1\;5C forward-word
bind \e\[1\;5D backward-word
bind \cH backward-kill-word
