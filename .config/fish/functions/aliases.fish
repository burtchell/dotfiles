
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

# Repace ls with exa
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first --no-permissions"
alias lt="exa -T --icons --group-directories-first --level=3 --git-ignore"
alias la="exa -la --icons --group-directories-first --no-permissions"

# Always enable colored grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
