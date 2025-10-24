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
# TODO: is there a version-agnostic way to do this? maybe try nvm again now that i'm on zsh
[ -d /opt/homebrew/opt/node@22/bin ] && export PATH="/opt/homebrew/opt/node@22/bin:$PATH"  

eval "$(zoxide init zsh)"
source <(fzf --zsh)  # fzf history widget
export FZF_DEFAULT_OPTS="--style minimal --gutter ' ' --color=bw,hl:magenta,hl+:magenta"

[ -r ~/.config/zsh/aliases.zsh ] && . ~/.config/zsh/aliases.zsh
[ -r ~/.config/zsh/extra.zsh ] && . ~/.config/zsh/extra.zsh
[ -r ~/.extra ] && . ~/.extra

get_dir() {
  local dir="${(%):-%~}"  # expand %~ like in prompt
  [[ "$dir" != "/" ]] && dir="${dir%/}" # remove trailing slash if not root /
  echo "$dir"
}
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PROMPT='%{$fg[magenta]%}$(get_dir)%{$fg[black]%}$(git_branch)%  %{$reset_color%}> '

# load plugins (must be done last)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
