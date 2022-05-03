# This script removes and links dotfiles to this repo.

# Link pwsh profile
if (Test-Path -Path $PROFILE -PathType Leaf) {
  Remove-Item $PROFILE
  Write-Host "Removed previously existing pwsh profile."
}
New-Item -ItemType HardLink -Path $PROFILE -Target "$HOME/dotfiles/windows/Microsoft.PowerShell_profile.ps1."

# Link neofetch configs
$neofetch = "$HOME/.config/neofetch/config.conf"
if (Test-Path -Path $neofetch -PathType Leaf) {
  Remove-Item $neofetch
  Write-Host "Removed previously existing neofetch config.conf."
}
New-Item -ItemType HardLink -Path $neofetch -Target "$HOME/dotfiles/.config/neofetch/config.conf"