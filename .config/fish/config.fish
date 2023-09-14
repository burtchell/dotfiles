# Starting point for fish configs

function fish_greeting
  neofetch
end

# Init oh-my-posh
oh-my-posh init fish --config ~/dotfiles/burtchell.simple.omp.json | source

# Get aliases
. ~/.config/fish/functions/aliases.fish

[ -r ~/.extra ] && [ -f ~/.extra ] && bash ~/.extra

# force arrow key word movement in terminal (gnome terminal interferes)
bind \e\[1\;5C forward-word
bind \e\[1\;5D backward-word
bind \cH backward-kill-word

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/brandon/miniconda3/bin/conda
    eval /Users/brandon/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

