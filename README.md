# dotfiles

My configuration files. Everything should work with WSL and macOS unless otherwise noted. This repo requires sudo privaleges for the most streamlined installation, but instructions are included to get neovim working on any linux machine.

## Dependencies

Install the following using your package manager. For example:

```
sudo apt install stow tmux
```

And clone tpm:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Homebrew

Install [homebrew](https://brew.sh) and run the "Next Steps" commands:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Reload the terminal. Then, install the following packages with homebrew:

```
brew install oh-my-posh neofetch exa fish fisher neovim fzf zoxide
```

### fish

To set fish as the default shell and make it aware of homebrew, run the following commands:

For Linux:

```
echo /home/linuxbrew/.linuxbrew/bin/fish | sudo tee -a /etc/shells
```

```
fish
```

```
fish_add_path /home/linuxbrew/.linuxbrew/bin
```

```
chsh -s /home/linuxbrew/.linuxbrew/bin/fish
```

For macOS:

```
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
```

```
fish
```

```
fish_add_path /opt/homebrew/bin
```

```
chsh -s /opt/homebrew/bin/fish
```

If fish isn't the default shell after a terminal reload, ensure it is after a full restart. If nothing else works, as a last resort, add `fish` to the end of `.profile`.

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

## Neovim without `sudo` privaleges

First, ensure dotfiles are cloned:

```
git clone git@github.com:dukeofjukes/dotfiles.git
```

To install and configure neovim without sudo, run the following commands from `~`:

```
mkdir neovim && cd neovim
```

```
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
```

```
chmod u+x nvim.appimage
```

```
./nvim.appimage --appimage-extract
```

Then add the following line to your shell configuration (e.g., `.bashrc`):

```
export PATH="~/neovim/squashfs-root/usr/bin:$PATH"
```

Then run the following command to manually create a symbolic link to the neovim config from my dotfiles:

```
ln -s ~/dotfiles/.config/nvim/ ~/.config/nvim
```

My neovim config depends on `npm` to install LSPs, which often isn't installed on servers. Run the following commands to locally install `npm` (credit to [David Golfarb](https://askubuntu.com/a/982003)):

```
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
```

```
. ~/.bashrc
```

```
mkdir ~/local ~/node-latest-install && cd ~/node-latest-install
```

```
wget -c http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
```

```
./configure --prefix=~/local
```

```
make install
```

```
wget -c https://www.npmjs.org/install.sh | sh
```

## Acknowledgements

- [Mathias Bynens](https://github.com/mathiasbynens) and their [dotfiles repository](https://github.com/mathiasbynens/dotfiles), which inspired my oh-my-posh theme and use of a private `.extra` file.

