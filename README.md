# dotfiles

My linux configuration files. Everything should work with WSL and macOS unless otherwise noted. This repo requires sudo privaleges to install dependencies, but in a pinch you could easily copy-paste the contents of particular files.

## Dependencies

### Stow

Install stow using your package manager. For example:

```
sudo apt install stow
```

### Homebrew

Install [homebrew](https://brew.sh) and run the "Next Steps" commands:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Reload the terminal. Then, install the following packages with homebrew:

```
brew install oh-my-posh neofetch exa fish fisher neovim
```

### fish

> Note: These directories will be different for macOS.

To set fish as the default shell, run the following commands

```
echo /home/linuxbrew/.linuxbrew/bin/fish | sudo tee -a /etc/shells;
fish
fish_add_path /home/linuxbrew/.linuxbrew/bin
chsh -s /home/linuxbrew/.linuxbrew/bin/fish
```

If fish isn't the default shell after a terminal reload, ensure it is after a full restart. If nothing else works, as a last resort, add `fish` to the end of `.profile`.

Lastly, install [z (cd history)](https://github.com/jethrokuan/z):

```
fisher install jethrokuan/z
```

## Clone and Link

After a terminal reload, clone this repo into the home directory (I recommend cloning via SSH):

```
git clone git@github.com:dukeofjukes/dotfiles.git
```

From `~/dotfiles/`, run:

```
stow .
```

Reload the terminal to ensure all changes have been made.

## `~/.extra`

If you have any extra commands and configurations that need to be loaded without forking/pushing to this repo, put them in `~/.extra`. This file will be untracked and can be used to add anything private. My `/.config/fish/config.fish` script will invoke this using bash every time fish starts up. Here's what mine looks like:

```
GIT_AUTHOR_NAME="Brandon Burtchell"
git config --global user.name "$GIT_AUTHOR_NAME"

GIT_AUTHOR_EMAIL="62345978+dukeofjukes@users.noreply.github.com"
git config --global user.email "$GIT_AUTHOR_EMAIL"

git config --global core.editor nvim
```

## On Windows

Be sure to copy-paste `/.config/alacritty/alacritty.toml` from this repo (from WSL file system) to `%appdata%\alacritty\` in your Windows file system.

## Acknowledgements

- [Mathias Bynens](https://github.com/mathiasbynens) and their [dotfiles repository](https://github.com/mathiasbynens/dotfiles), which inspired my oh-my-posh theme and use of a private `.extra` file.
- [chris@machine](https://github.com/LunarVim) and their [Neovim-from-scratch repository](https://github.com/LunarVim/Neovim-from-scratch) from which most of my lua-based nvim configuration is based.

## TODOs

- Automate neovim's lsp configs.lua file to apply global configs to every installed lsp (saves me a step when I use a new lsp).
- Add [which-key](https://github.com/folke/which-key.nvim) to neovim configs.
- Over time, simplify and tweak my neovim keybindings.
