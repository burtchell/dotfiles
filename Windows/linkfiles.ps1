# This script removes and links dotfiles to this repo.

# TODO: add prompt to make backups

# Link pwsh profile
if (Test-Path -Path $PROFILE -PathType Leaf) {
  Remove-Item $PROFILE
}
New-Item -ItemType HardLink -Path $PROFILE -Target "$HOME/dotfiles/windows/Microsoft.PowerShell_profile.ps1."

# TODO: add prompt here
# Copy neofetch so local changes can be made
$neofetch = "$HOME/.config/neofetch/config.conf"
if (Test-Path -Path $neofetch -PathType Leaf) {
  Remove-Item $neofetch
}
Copy-Item "$HOME/dotfiles/.config/neofetch/config.conf" -Destination "$HOME/.config/neofetch"