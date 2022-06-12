#!/bin/bash

# Allow aliases to be sudo'ed
alias sudo="sudo "

# Open windows explorer (WSL only, comment out if using this file on standalone linux)
alias exp="explorer.exe"

# Reload the shell
alias reload="exec ${SHELL} -l"

# Easier navigation: .., ..., ...., ....., and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Git shortcuts
alias g="git"
alias gs="git status"
alias gf="git fetch"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gp="git push"

# Vim alias
alias vi="nvim"
alias vim="nvim"

# Repace ls with exa
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first --no-permissions"
alias lt="exa -T --icons --group-directories-first --level=3"
alias la="exa -la --icons --group-directories-first --no-permissions"

# Always enable colored grep output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'