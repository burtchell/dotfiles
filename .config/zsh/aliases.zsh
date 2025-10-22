#!/usr/bin/env zsh

# allow aliases to be sudo'ed
alias sudo="sudo "

# if on WSL, add explorer alias
[ -x explorer.exe ] && alias open="explorer.exe"

alias reload="exec $SHELL -l" # reload the shell
alias :q="exit"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

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
if [[ -x ~/.config/scripts/get-github-url.sh ]]; then
  function gurl() {
    bash ~/.config/scripts/get-github-url.sh
  }
else
  alias gurl="git remote get-url origin" # fallback
fi

# replace ls with eza
alias ls="eza --icons --group-directories-first"
alias ll="eza -all --icons --group-directories-first"
alias la="eza -all --icons --group-directories-first"
alias lt="eza -Ta --icons --group-directories-first --level=4 --ignore-glob=\".git|node_modules\""

# nvim
alias vi="nvim"
alias vim="nvim"
alias im="nvim"
alias vm="nvim"
alias vmi="nvim"

# tmux
function tm() {
  if tmux has-session -t home 2>/dev/null; then
    tmux attach-session -t home
  else
    tmux new-session -s home
  fi
}
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

