# Starting point for fish configs

function fish_greeting
    # intentionally left blank
end

function fish_prompt
    string join '' -- (set_color magenta) (prompt_pwd --full-length-dirs=3 --dir-length=1) (set_color black) (git branch 2> /dev/null |sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/') (set_color normal) ' > '
end

function fish_right_prompt
    # intentionally left blank
end

# init zoxide
zoxide init fish | source

. ~/.config/fish/functions/aliases.fish
[ -r ~/.extra ] && [ -f ~/.extra ] && bash ~/.extra

# load conda on-command to prevent slow shell startup
function conda
    functions --erase conda
    if test -f $HOME/miniconda3/bin/conda
        eval $HOME/miniconda3/bin/conda "shell.fish" hook | source
    else
        if test -f "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
            . "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
        else
            set -x PATH "$HOME/miniconda3/bin" $PATH
        end
    end
    if type -q conda
        conda $argv
    end
end

# anything else that may be system specific:
if test -f ~/.config/fish/functions/extra.fish
    . ~/.config/fish/functions/extra.fish
end
