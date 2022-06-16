# dotfiles

This repository contains my linux configuration files. Windows dotfiles are [here](https://github.com/dukeofjukes/dotfiles-windows).

## Installation

Install [homebrew](https://brew.sh) and run the "Next Steps" commands:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After a terminal reload, clone this repo into the home `~` directory.

```
git clone https://github.com/dukeofjukes/dotfiles.git
```

Run the following script to install packages, link to this repo, and set fish as the default shell (you may be prompted for a sudo password). Follow the prompts to optionally create backups of preexisting dotfiles (saved in `~/dotfiles-backups/`):

```
bash ~/dotfiles/scripts/install.sh
```

Reload the terminal to ensure all changes have been made.

If you have any extra commands and configurations that need to be loaded without forking/pushing to this repo, put them in `~/.extra`. This file will be untracked and can be used to add anything private. Here's what mine looks like:

```
GIT_AUTHOR_NAME="Brandon Burtchell"
git config --global user.name "$GIT_AUTHOR_NAME"

GIT_AUTHOR_EMAIL="62345978+dukeofjukes@users.noreply.github.com"
git config --global user.email "$GIT_AUTHOR_EMAIL"

git config --global core.editor nvim
```

Note: If you would prefer to install packages manually or something goes wrong with `install.sh`, see [Linux Manual Installation](https://github.com/dukeofjukes/dotfiles/blob/main/manual.md).

## Acknowledgements

- [Mathias Bynens](https://github.com/mathiasbynens) and their [dotfiles repository](https://github.com/mathiasbynens/dotfiles), which inspired my oh-my-posh theme and use of a private `.extra` file.
- [Fireship](https://www.youtube.com/c/Fireship) and their [dotfiles tutorial](https://www.youtube.com/watch?v=r_MpUP6aKiQ), which showed me how to utilize symbolic links.
- [Takuya Matsuyama](https://github.com/craftzdog) and their [dotfiles repository](https://github.com/craftzdog/dotfiles-public) for inspiring my `.config/nvim/` file structure.
- [chris@machine](https://github.com/LunarVim) and their [Neovim-from-scratch repository](https://github.com/LunarVim/Neovim-from-scratch) from which most of my lua-based nvim configuration is based.
