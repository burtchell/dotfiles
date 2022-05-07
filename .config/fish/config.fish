if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Init oh-my-posh
oh-my-posh init fish --config ~/dotfiles/burtchell.simple.omp.json | source

# Get aliases
. ~/.config/fish/functions/aliases.fish