# dotfiles

This repository contains my personal terminal/shell/prompt configuration files in order to make environment customization easier on multiple machines. This readme is structured to be followed in order, starting with installing necessary Windows programs/packages, then setting up Ubuntu on WSL and installing the Linux-side packages.

## 1) Windows

Install the following programs/packages on Windows:
  1. [Windows Terminal](https://github.com/microsoft/terminal)
  2. [Powershell Core](https://github.com/PowerShell/PowerShell)
  3. [Scoop](https://github.com/ScoopInstaller/Scoop)
  4. [Oh My Posh](https://ohmyposh.dev/)
  5. [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
  6. [PSReadLine](https://github.com/PowerShell/PSReadLine): Run ```Install-Module PSReadLine -AllowPrerelease -Force``` in order to get the pre-release version with list-view.
  7. [Git](https://gitforwindows.org/) and [GitHub CLI](https://github.com/cli/cli)
  8. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)
  9. [neofetch](https://github.com/dylanaraps/neofetch)

Clone this repository in ```C:/Users/[username]/```. The following files are contained in [```/Windows/```](https://github.com/dukeofjukes/configs/tree/main/Windows), and need to be copied into the proper directories to take effect:
- the Windows Terminal [```settings.json```](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) file with default color scheme, font, keyboard shortcuts, etc. Copy the contents of this file and paste them wherever Windows installs Terminal. A [Nerd Font](https://www.nerdfonts.com/font-downloads) will need to be installed for the font setting to be applied (and for oh-my-posh to work in the next step). I prefer "Caskaydia Cove".
- the PowerShell [```Microsoft.PowerShell_profile.ps1```](https://github.com/dukeofjukes/configs/blob/main/Windows/Microsoft.PowerShell_profile.ps1) file that contains shell intializations, aliases, utility functions, etc. Copy this file into the ```$PROFILE``` location to take effect.

Afterwards, all Windows configuration should be applied. Next, we'll do the same to the Ubuntu subsystem.

## 2) Ubuntu on WSL2

Run ```wsl --install -d Ubuntu``` to install the Ubuntu subsystem. Note that when using Windows Subsystem for Linux (WSL), the Windows C drive is located in ```/mnt/c/```. Therefore, if this repository is already cloned in ```/mnt/c/Users/[username]/```, it can be accessed via WSL and doesn't need to be cloned again on the Linux side.

Install the following packages:
  1. [homebrew](https://brew.sh)
  2. [oh-my-posh](https://ohmyposh.dev/)
  3. [neofetch](https://github.com/dylanaraps/neofetch)
  4. [GitHub CLI](https://github.com/cli/cli) (git should be preinstalled by Ubuntu)
  5. [z (cd history)](https://github.com/rupa/z): Place the ```/z-master/``` directory in ```/home/[username]/```.
  6. [exa (modernized ls)](https://github.com/ogham/exa)

The following files are contained in [```/Linux/```](https://github.com/dukeofjukes/configs/tree/main/Linux) and need to be copied into the proper directories to take effect:
- the linux [```.profile```](https://github.com/dukeofjukes/configs/blob/main/Linux/.profile) file contains shell path variables and inits. Copy its contents in ```~/.profile```.
- the bash [```.bashrc```](https://github.com/dukeofjukes/configs/blob/main/Linux/.bashrc) file contains aliases and more. Copy its contents in ```~/.bashrc```.

## 3) Configurations for all platforms

- My custom Oh My Posh theme ([```burtchell.omp.json```](https://github.com/dukeofjukes/dotfiles/blob/main/burtchell.omp.json)) should automatically installed by each operating system's shell configs from above. Nothing else to do here.
- The neofetch config is in [```config.conf```](https://github.com/dukeofjukes/dotfiles/blob/main/config.conf), and needs to be copied to ```~/.config/neofetch/``` in both operating systems.
