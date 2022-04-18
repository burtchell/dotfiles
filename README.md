# configs

The repository contains my personal configuration files, in order to make environment customization easier on multiple machines.

## All Platforms

Cross-platform configuration files are in the parent directory.
- [```burtchell.omp.json```](https://github.com/dukeofjukes/configs/blob/main/burtchell.omp.json) is my tweaked [oh-my-posh](https://ohmyposh.dev/) theme based on the default theme. Each OS's shell will point to this location to apply the prompt.

## Windows

Clone this repository in ```C:/Users/[username]/```. The following files are contained in [[```/Windows/```](https://github.com/dukeofjukes/configs/tree/main/Windows), and need to be copied into the proper directories to take effect:
- the Windows Terminal [```settings.json```](https://github.com/dukeofjukes/configs/blob/main/Windows/terminal.settings.json) file with default color scheme, font, keyboard shortcuts, etc. Copy the contents of this file and paste them wherever Windows installs Terminal.
- the PowerShell [```Microsoft.PowerShell_profile.ps1```](https://github.com/dukeofjukes/configs/blob/main/Windows/Microsoft.PowerShell_profile.ps1) file that contains shell intializations, aliases, utility functions, etc. Copy this file into the $PROFILE location to take effect. The following must be installed for maximum functionality:
  1. [oh-my-posh](https://ohmyposh.dev/)
  2. [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
  3. [PSReadLine](https://github.com/PowerShell/PSReadLine): Run ```Install-Module PSReadLine -AllowPrerelease -Force``` in order to get the pre-release version with list-view.
  4. [Git](https://gitforwindows.org/) and [GitHub CLI](https://github.com/cli/cli#installation)
  5. [z (cd history)](https://www.powershellgallery.com/packages/z/1.1.13)

## Linux

(under construction)
