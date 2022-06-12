#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

# ensure this script is run with sudo privileges
sudo -n true
test $? -eq 0 || exit 1 "You should have sudo privilege to run this script."

cd ~

echo Installing brew packages...;
brew install oh-my-posh neofetch gh exa fish fisher neovim;

echo Setting fish as default shell...;
fish ./dotfiles/scripts/setdefault.fish;

while true; do
  read -p "Do you want to link dotfiles now? [y/n] " link
  
  case $link in
    [yY] ) bash ./dotfiles/scripts/linkfiles.sh;
      break;;
    [nN] ) echo Skipping linkfiles.sh...;
      break;;
    * ) echo Invalid response.;;
  esac
done
