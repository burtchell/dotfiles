# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# completion options
zstyle ':completion:*' menu select  # tab opens cmp menu
zstyle ':completion:*' special-dirs true  # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33  # colorize cmp menu
# zstyle ':completion:*' file-list true  # more detailed list
zstyle ':completion:*' squeeze-slashes false  # explicit disable to allow /*/ expansion

# main options
setopt prompt_subst  # enable prompt substitution
setopt histignorealldups append_history inc_append_history share_history  # better history
setopt autocd
setopt auto_param_slash  # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match  # make cmp case insensitive
setopt globdots  # include dotfiles
# setopt correct  # suggest spelling corrections

# history options
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# load homebrew in linux or macOS
[ -d /home/linuxbrew/.linuxbrew/bin ] && export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"

eval "$(zoxide init zsh)"
# source <(fzf --zsh)  # fzf history widget
# source <(sk --shell zsh)  # sk history widget

# lazy-load conda
function conda() {
  unset -f conda
  if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/miniconda3/bin:$PATH"
  fi
  conda "$@"
}

# lazy-load nvm
# lazy_load_nvm() {
#   unset -f node nvm
#   export NVM_DIR=~/.nvm
#   [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
# }
# node() {
#   lazy_load_nvm
#   node $@
# }
# nvm() {
#   lazy_load_nvm
#   node $@
# }

[ -r ~/.config/zsh/aliases.zsh ] && . ~/.config/zsh/aliases.zsh
[ -r ~/.config/zsh/extra.zsh ] && . ~/.config/zsh/extra.zsh
[ -r ~/.extra ] && . ~/.extra

# define prompt
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PROMPT='%{$fg[magenta]%}%~%{$fg[black]%}$(git_branch)%  %{$reset_color%}> '

# load plugins (must be done last)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
