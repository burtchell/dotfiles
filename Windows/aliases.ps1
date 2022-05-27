# This file contains all aliases, and will be sourced in the default PowerShell profile 
# (~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1).

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

function global:ReloadPowerShell() { & $PROFILE }
Set-Alias -Name 'reload' -Value 'ReloadPowerShell' -Scope Global

# open windows explorer
Set-Alias -Name 'exp' -Value 'explorer' -Scope Global
Set-Alias -Name 'open' -Value 'explorer' -Scope Global

Set-Alias -Name 'grep' -Value 'findstr' -Scope Global

# ls variations (for consistency with linux muscle-memory)
Set-Alias -Name 'ls' -Value 'dir' -Scope Global
Set-Alias -Name 'll' -Value 'dir' -Scope Global
function global:ListTreeFiles() { & tree /F /a $args }
Set-Alias -Name 'lt' -Value 'ListTreeFiles' -Scope Global
Set-Alias -Name 'la' -Value 'dir' -Scope Global

# jekyll site local launch with live reload
function global:JekyllExec() { & bundle exec jekyll serve --livereload $args }
Set-Alias -Name 'exek' -Value 'JekyllExec' -Scope Global
