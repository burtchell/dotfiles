# dotfiles

This repository contains my personal terminal/shell/prompt configuration files in order to make environment customization easier on multiple machines. This README is structured to be followed in order, starting with installing necessary Windows programs/packages, then setting up Ubuntu on WSL and installing the Linux-side packages. 

Note: If someone stumbles upon this repo and wants to try out my setup, be sure to change the `/Brandon/` user directory name when it appears in any of the script files.

## Windows

Install the following programs/packages on Windows:

1. [Windows Terminal](https://github.com/microsoft/terminal) (recommended: install through Microsoft Store)
2. [Powershell Core](https://github.com/PowerShell/PowerShell) (recommended: install through winget or other command-line package manager)
3. [Scoop](https://github.com/ScoopInstaller/Scoop)
4. [Oh My Posh](https://ohmyposh.dev/)
5. [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
6. [PSReadLine](https://github.com/PowerShell/PSReadLine): Run `Install-Module PSReadLine -AllowPrerelease -Force` in order to get the pre-release version with list-view.
7. [Git](https://gitforwindows.org/) and [GitHub CLI](https://github.com/cli/cli)
8. [Node.js](https://nodejs.org/en/)
9. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)
10. [neofetch](https://github.com/dylanaraps/neofetch)

Clone this repository in `C:/Users/[username]/`. The following files are contained in [`/Windows/`](https://github.com/dukeofjukes/configs/tree/main/Windows), and need to be applied:

- the Windows Terminal [`settings.json`](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) file with default color scheme, font, keyboard shortcuts, etc. Copy the contents of this file and paste them wherever Windows installs Terminal. A [Nerd Font](https://www.nerdfonts.com/font-downloads) will need to be installed for the font setting to be applied (and for oh-my-posh to work in the next step). I prefer "Caskaydia Cove".
- [`burtchell.pwsh.ps1`](https://github.com/dukeofjukes/configs/blob/main/Windows/burtchell.pwsh.ps1) contains PowerShell intializations, aliases, utility functions, etc. To apply it, copy the following line into PowerShell's `$PROFILE` (run `echo $PROFILE` to find, otherwise create the file: `~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1`):

```
~\dotfiles\Windows\burtchell.pwsh.ps1
```

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

- Find a way to share .gitconfig without the user.name and user.email.
- Convert dotfiles to link to repo rather than running the shell script (better maintainability).
  - Done for Linux, need to do the same for Windows.
- Write a bootstrapper script for Windows and Linux that installs all necessary packages (through homebrew, etc), and links all dotfiles.
  - Done with linkfiles.sh on Linux.
- Add section for macOS (once I get a macbook).
