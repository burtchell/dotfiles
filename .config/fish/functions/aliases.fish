# fish shell aliases

function addpaths
    contains -- $argv $fish_user_paths
    or set -U fish_user_paths $fish_user_paths $argv
    echo "Updated PATH: $PATH"
end

function removepath
    if set -l index (contains -i $argv[1] $PATH)
        set --erase --universal fish_user_paths[$index]
        echo "Updated PATH: $PATH"
    else
        echo "$argv[1] not found in PATH: $PATH"
    end
end

# Allow aliases to be sudo'ed
alias sudo="sudo "

# If on WSL, add explorer alias
if type -q explorer.exe
    alias exp="explorer.exe"
    alias open="explorer.exe"
end

alias reload="exec $SHELL -l"
alias :q="exit"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Git shortcuts
alias g="git"
alias gs="git status"
alias gf="git fetch"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log"
alias gg='git log --graph --date=human --all --pretty="%C(yellow)%h %C(blue)%ad %C(green)%d%n%C(white)%s"%n'
alias gd="git diff"

if test -e ~/.config/scripts/get-github-url.sh
    function gurl
        bash ~/.config/scripts/get-github-url.sh
    end
else
    alias gurl="git remote get-url origin" # fallback
end

# Repace ls with exa
alias ls="eza --icons --group-directories-first"
alias ll="eza -all --icons --group-directories-first"
alias la="eza -all --icons --group-directories-first"
alias lt="eza -Ta --icons --group-directories-first --level=4 --ignore-glob=\".git|node_modules\""

# nvim alias
alias vi="nvim"
alias vim="nvim"
alias im="nvim"
alias vm="nvim"
alias vmi="nvim"

# tmux
function tm
    if tmux has-session -t home #^/dev/null
        echo "Attaching to existing home session..."
        tmux attach-session -t home
    else
        echo "Creating new home session..."
        tmux new-session -s home
    end
end
alias tml="tmux ls"
alias tmls="tmux ls"
alias tma="tmux attach-session"
alias tmat="tmux attach-session -t"
alias tmka="tmux kill-session -a"
alias tmkt="tmux kill-session -t"
alias tmn="tmux new-session"
alias tmns="tmux new -s"

# Always enable colored grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
