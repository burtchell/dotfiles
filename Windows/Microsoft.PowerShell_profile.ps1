# copy-paste this file or text to the location of the profile (i.e. ~/Documents/PowerShell)

# oh-my-posh (note file location. this repo should be cloned there.)
oh-my-posh init pwsh --config ~/dotfiles/burtchell.omp.json | Invoke-Expression

# terminal icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# git aliases
Set-Alias g git

function GitStatus() { & git status $args }
Set-Alias -Name 'gs' -Value 'GitStatus' -Scope Global

function GitFetch() { & git fetch $args }
Set-Alias -Name 'gf' -Value 'GitFetch' -Scope Global

function GitAdd() { & git add $args }
Set-Alias -Name 'ga' -Value 'GitAdd' -Scope Global

function GitAddAll() { & git add -A }
Set-Alias -Name 'gaa' -Value 'GitAddAll' -Scope Global

function GitCommit() { & git commit -m $args } # note: requires a message (best practice)
Remove-Item 'Alias:\gc' -Force # override an alias for Get-Content cmdlet
Set-Alias -Name 'gc' -Value 'GitCommit' -Scope Global

function GitPush() { & git push $args }
Remove-Item 'Alias:\gp' -Force # override an alias for Get-ItemProperty cmdlet
Set-Alias -Name 'gp' -Value 'GitPush' -Scope Global

# misc. aliases
Set-Alias exp explorer
Set-Alias grep findstr
Set-Alias ll dir