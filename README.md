# dotfiles

This repository contains my personal terminal/shell/prompt configuration files in order to make environment customization easier on multiple machines. This README is structured to be followed in order, starting with installing necessary Windows programs/packages, then setting up Ubuntu on WSL and installing the Linux-side packages.

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

Then, clone this repo into the user's home (`~`) directory:

```
gh repo clone dukeofjukes/dotfiles
# or use SSH or HTTPS
```

Run this script to link the PowerShell $PROFILE to this repo:

```
. ~/dotfiles/windows/linkfiles.ps1
```

The Windows Terminal [`settings.json`](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) contains terminal configs. Copy the components of this file you want and paste them wherever Windows installs Terminal (Warning: blindly replacing your terminal settings file can cause lots of bugs, particularly when it searches the provided filepaths for shells).

Afterwards, all Windows configuration should be applied. Next, we'll do the same to the WSL.

## Linux (WSL)

Run `wsl --install -d Ubuntu` to install the Ubuntu subsystem. To ensure WSL2 was used, run `wsl -l -v` and check the version number. If not version 2, see [how to upgrade](https://docs.microsoft.com/en-us/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2).

Install the following packages:

1. [homebrew](https://brew.sh)
2. [oh-my-posh](https://ohmyposh.dev/)
3. [neofetch](https://github.com/dylanaraps/neofetch)
4. [GitHub CLI](https://github.com/cli/cli) (git is included in Ubuntu)
5. [Node.js](https://nodejs.org/en/) via [WSL instructions](https://docs.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl)
6. [z (cd history)](https://github.com/rupa/z): Place the `/z-master/` directory in `/home/[username]/`.
7. [exa (modernized ls)](https://github.com/ogham/exa) (as of 2021/04/27: install using macOS homebrew instructions)

Then, clone this repo into the user's home (`~`) directory:

```
gh repo clone dukeofjukes/dotfiles
# or use SSH or HTTPS
```

Run this script to link all dotfiles to this repo:

```
. ~/dotfiles/linux/linkfiles.sh
```

## TODO:

- Find a way to share .gitconfig without the user.name and user.email, if my git configs end up getting more complex.
- Write a bootstrapper script for Windows and Linux that installs all necessary packages (through homebrew, etc).
- Add section for macOS (once I get a macbook).
