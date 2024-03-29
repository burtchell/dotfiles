# fish shell aliases

# Allow aliases to be sudo'ed
alias sudo="sudo "

# If on WSL, add explorer alias
if type -q explorer.exe
  alias exp="explorer.exe"
  alias open="explorer.exe"
end

# Reload the shell
alias reload="exec $SHELL -l"

# Easier navigation: .., ..., ...., ....., and -
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

# Repace ls with exa
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first --no-permissions"
alias lt="exa -Ta --icons --group-directories-first --level=4 --ignore-glob=\".git|node_modules\""
alias la="exa -l --all --icons --group-directories-first --no-permissions"

# nvim alias
alias vi="nvim"
alias vim="nvim"

# tmux
alias tm="tmux"
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

# serve a localhost server with npm
if type -q npm
  set -l LOCAL_IP `ipconfig getifaddr en0`
  alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"
end

# upgrade and update all packages (apt and brew)
alias updateall="sudo apt update -y && sudo apt upgrade -y && brew update && brew upgrade"

alias neofetch="neofetch --ascii ~/.config/neofetch/slime.txt"

