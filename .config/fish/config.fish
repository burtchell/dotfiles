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
# . ~/.config/fish/functions/keychain.fish
[ -r ~/.extra ] && [ -f ~/.extra ] && bash ~/.extra

# force arrow key word movement in terminal (gnome terminal interferes)
# bind \e\[1\;5C forward-word
# bind \e\[1\;5D backward-word
# bind \cH backward-kill-word

# for macOS
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/brandon/miniconda3/bin/conda
    eval /home/brandon/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/brandon/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/brandon/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/brandon/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# for linux
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/brandon/miniconda3/bin/conda
    eval /home/brandon/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/brandon/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/brandon/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/brandon/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# anything else that may be system specific:
if test -f ~/.config/fish/functions/extra.fish
  . ~/.config/fish/functions/extra.fish
end
