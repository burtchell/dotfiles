# dotfiles

This repository contains my personal terminal/shell/prompt configuration files in order to make environment customization easier on multiple machines.

## Windows

Install the following programs/packages on Windows:

1. [Windows Terminal](https://github.com/microsoft/terminal) (recommended: install through Microsoft Store)
2. [Powershell Core](https://github.com/PowerShell/PowerShell) (recommended: install through winget or other command-line package manager)
3. [Scoop](https://github.com/ScoopInstaller/Scoop)
4. [Oh My Posh](https://ohmyposh.dev/)
5. A [Nerd Font](https://www.nerdfonts.com/font-downloads) (I prefer "Caskaydia Cove")
6. [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
7. [PSReadLine](https://github.com/PowerShell/PSReadLine): Run `Install-Module PSReadLine -AllowPrerelease -Force` in order to get the pre-release version with list-view.
8. [Git](https://gitforwindows.org/) and [GitHub CLI](https://github.com/cli/cli)
9. [Node.js](https://nodejs.org/en/)
10. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)
11. [neofetch](https://github.com/dylanaraps/neofetch)

Clone this repo into the user's home (`~`) directory and run the script to link all dotfiles to this repo:

```
gh repo clone dukeofjukes/dotfiles
. ~/dotfiles/windows/linkfiles.ps1
```

The Windows Terminal [`settings.json`](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) contains terminal configs. Copy the components of this file you want and paste them wherever Windows installs Terminal (Warning: blindly replacing your terminal settings file can cause lots of bugs, particularly when it searches the provided filepaths for shells).

Afterwards, all Windows configuration should be applied. Follow the next section if using WSL.

## Linux (Ubuntu-based)

If using WSL, run `wsl --install -d Ubuntu` to install the Ubuntu subsystem. To ensure WSL2 was used, run `wsl -l -v` and check the version number. If not version 2, see [how to upgrade](https://docs.microsoft.com/en-us/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2).

If not using WSL, be sure to install a [Nerd Font](https://www.nerdfonts.com/font-downloads) to your Linux distro.

Install [homebrew](https://brew.sh) and run the "Next Steps" commands:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After a terminal reload, clone this repo into the home `~` directory.

```
git clone https://github.com/dukeofjukes/dotfiles.git
```

Run the following command to install packages and create symbolic links to the dotfiles in this repo. Follow the prompts to optionally change the default shell to fish and make backups of preexisting dotfiles (saved in ~/dotfiles-backups):

```
bash ~/dotfiles/linux/install.sh
```

Reload the terminal to ensure all changes have been made.

Note: If you would prefer to install packages manually rather than running `install.sh`, see [Linux Manual Installation](https://github.com/dukeofjukes/dotfiles/blob/main/linux/README.md)

## macOS

Install the following:

1. [iTerm2](https://iterm2.com/)
1. A [Nerd Font](https://www.nerdfonts.com/font-downloads) (I prefer "Caskaydia Cove")
1. [homebrew](https://brew.sh)
1. [fish](https://fishshell.com) using `brew install fish`

To set fish as the default shell, add the following line to the top of `/etc/shells`:

```
/opt/homebrew/bin/fish
```

Then, run the following commands:

```
fish
fish_add_path /opt/homebrew/bin
chsh -s /opt/homebrew/bin/fish
```

After a reload, iTerm2 should default to fish. Now, install the following packages with homebrew:

```
brew install oh-my-posh neofetch gh exa fisher
```

1. [oh-my-posh](https://ohmyposh.dev/)
1. [neofetch](https://github.com/dylanaraps/neofetch)
1. [GitHub CLI](https://github.com/cli/cli)
1. [exa (modernized ls)](https://github.com/ogham/exa)
1. [fisher](https://github.com/jorgebucaran/fisher)

And install the following with fisher:

1. [z (cd history)](https://github.com/jethrokuan/z) using `fisher install jethrokuan/z`

Lastly, install the following without a package manager:

1. [Node.js](https://nodejs.org/en/)

Clone this repo into the user's home (`~`) directory and run the script to link all dotfiles to this repo:

```
gh repo clone dukeofjukes/dotfiles
. ~/dotfiles/macos/linkfiles.sh
```

## TODO:

- Find a way to share .gitconfig without the user.name and user.email, if my git configs end up getting more complex.
- Write a bootstrapper installation script for Windows
