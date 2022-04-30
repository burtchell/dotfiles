# oh-my-posh
oh-my-posh init pwsh --config ~/dotfiles/burtchell.omp.json | Invoke-Expression

# terminal icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# git aliases
Set-Alias -Name 'g' -Value 'git' -Scope Global

function global:GitStatus() { & git status $args }
Set-Alias -Name 'gs' -Value 'GitStatus' -Scope Global

function global:GitFetch() { & git fetch $args }
Set-Alias -Name 'gf' -Value 'GitFetch' -Scope Global

function global:GitAdd() { & git add $args }
Set-Alias -Name 'ga' -Value 'GitAdd' -Scope Global

function global:GitAddAll() { & git add -A }
Set-Alias -Name 'gaa' -Value 'GitAddAll' -Scope Global

function global:GitCommit() { & git commit -m $args } # note: requires a message (best practice)
Remove-Item 'Alias:\gc' -Force # override an alias for Get-Content cmdlet
Set-Alias -Name 'gc' -Value 'GitCommit' -Scope Global

function global:GitPush() { & git push $args }
Remove-Item 'Alias:\gp' -Force # override an alias for Get-ItemProperty cmdlet
Set-Alias -Name 'gp' -Value 'GitPush' -Scope Global

# misc. aliases
Set-Alias -Name 'exp' -Value 'explorer' -Scope Global
Set-Alias -Name 'grep' -Value 'findstr' -Scope Global
Set-Alias -Name 'ls' -Value 'dir' -Scope Global
Set-Alias -Name 'll' -Value 'dir' -Scope Global