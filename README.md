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
10. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)
11. [neofetch](https://github.com/dylanaraps/neofetch)

Clone this repo into the user's home (`~`) directory and run the script to link all dotfiles to this repo:

```
gh repo clone dukeofjukes/dotfiles
. ~/dotfiles/windows/linkfiles.ps1
```

The Windows Terminal [`settings.json`](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) contains terminal configs. Copy the components of this file you want and paste them wherever Windows installs Terminal (Warning: blindly replacing your terminal settings file can cause lots of bugs, particularly when it searches the provided filepaths for shells). At the very least, I recommend adding `-nologo` to the PowerShell command line in Windows Terminal.

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

Run the following command to install packages and create symbolic links to the dotfiles in this repo. Follow the prompts to optionally change the default shell to fish and make backups of preexisting dotfiles (saved in `~/dotfiles-backups/`):

```
bash ~/dotfiles/linux/install.sh
```

Reload the terminal to ensure all changes have been made.

If you have any extra commands and configurations that need to be loaded without forking/pushing to this repo, put them in `~/.extra`. This file will be untracked and can be used to add anything private (i.e. git name and email).

Note: If you would prefer to install packages manually rather than running `install.sh`, see [Linux Manual Installation](https://github.com/dukeofjukes/dotfiles/blob/main/linux/README.md).

## TODO:

- Reorganize file structure.
- Create seperate aliases file for windows, source .extra in windows.
- Write a bootstrapper installation script for Windows
