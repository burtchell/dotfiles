# copy-paste this file or text to the location of the profile (i.e. ~/Documents/PowerShell)

# oh-my-posh (note file location. this repo should be cloned there.)
oh-my-posh init pwsh --config ~/configs/burtchell.omp.json | Invoke-Expression

# terminal icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# aliases
Set-Alias g git
Set-Alias exp explorer
Set-Alias grep findstr
Set-Alias ll dir