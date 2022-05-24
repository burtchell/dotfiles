#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

# ensure this script is run with sudo privileges
sudo -n true
test $? -eq 0 || exit 1 "You should have sudo privilege to run this script."

cd ~

echo Installing brew packages...

# install necessary brew apps
brew install oh-my-posh neofetch gh exa

while true; do
  read -p "Do you want to install fish and make it the default shell? [y/n] " fish

  case $fish in
    [yY] ) echo Installing fish and setting as default...;
      brew install fish fisher;
      fish ./dotfiles/linux/setdefault.fish;
      break;;
    [nN] ) echo Skipping fish installation...;
      break;;
    * ) echo Invalid response.;;
  esac
done

while true; do
  read -p "Do you want to link dotfiles now? [y/n] " link
  
  case $link in
    [yY] ) bash ./dotfiles/linux/linkfiles.sh;
      break;;
    [nN] ) echo Skipping linkfiles.sh...;
      break;;
    * ) echo Invalid response.;;
  esac
done
