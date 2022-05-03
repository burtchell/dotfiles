

# Link profile to repo
if (Test-Path -Path $PROFILE -PathType Leaf) {
  Remove-Item $PROFILE
  Write-Host "Removed previously existing pwsh profile."
}
New-Item -ItemType HardLink -Path $PROFILE -Target "$HOME\dotfiles\windows\Microsoft.PowerShell_profile.ps1."
