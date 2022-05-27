# The default PowerShell profile. Symbolically linked by ~/dotfiles/linkfiles.ps1.

# source aliases
. ~/dotfiles/windows/aliases.ps1

# source extra
If (Test-Path -Path ~/extra.ps1) {
  . ~/extra.ps1
}

# init oh-my-posh
oh-my-posh init pwsh --config ~/dotfiles/burtchell.simple.omp.json | Invoke-Expression

# import terminal icons
Import-Module -Name Terminal-Icons

# set PSReadLine preferences
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# run neofetch on startup
neofetch