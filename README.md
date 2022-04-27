# dotfiles

This repository contains my personal terminal/shell/prompt configuration files in order to make environment customization easier on multiple machines. This readme is structured to be followed in order, starting with installing necessary Windows programs/packages, then setting up Ubuntu on WSL and installing the Linux-side packages. If someone stumbles upon this repo and wants to try out my setup, be sure to change the `/Brandon/` user directory name when it appears in any of the script files.

## 1) Windows

Install the following programs/packages on Windows:

1. [Windows Terminal](https://github.com/microsoft/terminal) (recommended: Microsoft Store)
2. [Powershell Core](https://github.com/PowerShell/PowerShell) (recommended: Microsoft Store)
3. [Scoop](https://github.com/ScoopInstaller/Scoop)
4. [Oh My Posh](https://ohmyposh.dev/)
5. [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
6. [PSReadLine](https://github.com/PowerShell/PSReadLine): Run `Install-Module PSReadLine -AllowPrerelease -Force` in order to get the pre-release version with list-view.
7. [Git](https://gitforwindows.org/) and [GitHub CLI](https://github.com/cli/cli)
8. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)
9. [neofetch](https://github.com/dylanaraps/neofetch)

Clone this repository in `C:/Users/[username]/`. The following files are contained in [`/Windows/`](https://github.com/dukeofjukes/configs/tree/main/Windows), and need to be applied:

- the Windows Terminal [`settings.json`](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) file with default color scheme, font, keyboard shortcuts, etc. Copy the contents of this file and paste them wherever Windows installs Terminal. A [Nerd Font](https://www.nerdfonts.com/font-downloads) will need to be installed for the font setting to be applied (and for oh-my-posh to work in the next step). I prefer "Caskaydia Cove".
- [`burtchell.pwsh.ps1`](https://github.com/dukeofjukes/configs/blob/main/Windows/burtchell.pwsh.ps1) contains PowerShell intializations, aliases, utility functions, etc. To apply it, copy the following line into PowerShell's `$PROFILE` (run `echo $PROFILE` to find, otherwise create the file: `~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1`):

```
~\dotfiles\Windows\burtchell.pwsh.ps1
```

Afterwards, all Windows configuration should be applied. Next, we'll do the same to the Ubuntu subsystem.

## 2) Ubuntu on WSL2

Run `wsl --install -d Ubuntu` to install the Ubuntu subsystem. To ensure WSL2 was used, run `wsl -l -v` and check the version number. If not version 2, see [how to upgrade](https://docs.microsoft.com/en-us/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2). Note that when using Windows Subsystem for Linux (WSL), the Windows C drive is located in `/mnt/c/`. Therefore, if this repository is already cloned in `/mnt/c/Users/[username]/`, it can be accessed via WSL and doesn't need to be cloned again on the Linux side.

Install the following packages:

1. [homebrew](https://brew.sh)
2. [oh-my-posh](https://ohmyposh.dev/)
3. [neofetch](https://github.com/dylanaraps/neofetch)
4. [GitHub CLI](https://github.com/cli/cli) (git should be preinstalled by Ubuntu)
5. [z (cd history)](https://github.com/rupa/z): Place the `/z-master/` directory in `/home/[username]/`.
6. [exa (modernized ls)](https://github.com/ogham/exa) (as of 2021/04/27: install using macOS homebrew instructions)

The following files are contained in [`/Linux/`](https://github.com/dukeofjukes/configs/tree/main/Linux) and need to be applied in the linux config files:

- [`profile.sh`](https://github.com/dukeofjukes/configs/blob/main/Linux/profile.sh) contains shell initializations. To apply it, copy the following function into `~/.profile`:

```
if [ -f /mnt/c/Users/[username]/dotfiles/Linux/profile.sh ]; then
    . /mnt/c/Users/[username]/dotfiles/Linux/profile.sh
fi
```

- [`bashrc.sh`](https://github.com/dukeofjukes/configs/blob/main/Linux/bashrc.sh) contains aliases and more. To apply it, copy the following function into `~/.bashrc`:

```
if [ -f /mnt/c/Users/[username]/dotfiles/Linux/bashrc.sh ]; then
    . /mnt/c/Users/[username]/dotfiles/Linux/bashrc.sh
fi
```

NOTE: CRLF/LF formats can get swapped when cloning/pushing with git on multiple operating systems, ensure `profile.sh` and `bashrc.sh` are in LF format to avoid headache.

## 3) Configurations for all platforms

- My custom Oh My Posh theme [`burtchell.omp.json`](https://github.com/dukeofjukes/dotfiles/blob/main/burtchell.omp.json) should automatically installed by each operating system's shell configs from above. Nothing else to do here.
- The neofetch config is in [`config.conf`](https://github.com/dukeofjukes/dotfiles/blob/main/config.conf), and needs to be copied to `~/.config/neofetch/` in both operating systems.
