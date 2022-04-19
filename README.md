# Terminal Configs

The repository contains my personal terminal/shell/prompt configuration files, in order to make environment customization easier on multiple machines.

## All Platforms

Cross-platform configuration files are in the parent directory.
- [```burtchell.omp.json```](https://github.com/dukeofjukes/configs/blob/main/burtchell.omp.json) is my tweaked [Oh My Posh](https://ohmyposh.dev/) theme based on the default theme. Each OS's shell will point to this location to apply the prompt.

## Windows

Clone this repository in ```C:/Users/[username]/```. The following files are contained in [```/Windows/```](https://github.com/dukeofjukes/configs/tree/main/Windows), and need to be copied into the proper directories to take effect:
- the Windows Terminal [```settings.json```](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) file with default color scheme, font, keyboard shortcuts, etc. Copy the contents of this file and paste them wherever Windows installs Terminal.
- the PowerShell [```Microsoft.PowerShell_profile.ps1```](https://github.com/dukeofjukes/configs/blob/main/Windows/Microsoft.PowerShell_profile.ps1) file that contains shell intializations, aliases, utility functions, etc. Copy this file into the ```$PROFILE``` location to take effect. The following must be installed for maximum functionality:
  1. [Oh My Posh](https://ohmyposh.dev/)
  2. [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
  3. [PSReadLine](https://github.com/PowerShell/PSReadLine): Run ```Install-Module PSReadLine -AllowPrerelease -Force``` in order to get the pre-release version with list-view.
  4. [Git](https://gitforwindows.org/) and [GitHub CLI](https://github.com/cli/cli)
  5. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)

## WSL2

Note: When using Windows Subsystem for Linux, the Windows C drive is located in ```/mnt/c/```. Therefore, if this repo is already cloned in ```/mnt/c/Users/[username]/```, it can be accessed via WSL.

The following files are contained in [```/Linux/```](https://github.com/dukeofjukes/configs/tree/main/Linux) and need to be copied into the proper directories to take effect:
- the linux [```.profile```](https://github.com/dukeofjukes/configs/blob/main/Linux/.profile) file contains shell path variables and inits. Copy its contents in ```~/.profile```. Ensure these programs are installed in order for path variables to function properly:
  1. [homebrew](https://brew.sh)
  2. [oh-my-posh](https://ohmyposh.dev/)
- the bash [```.bashrc```](https://github.com/dukeofjukes/configs/blob/main/Linux/.bashrc) file contains aliases and more. Copy its contents in ```~/.bashrc```. Ensure these programs are installed in order for aliases to function properly:
  1. [GitHub CLI](https://github.com/cli/cli)
  2. [z (cd history)](https://github.com/rupa/z): Download ```/z-master/``` folder to ```/home/[username]```.
  3. [exa (modernized ls)](https://github.com/ogham/exa)
