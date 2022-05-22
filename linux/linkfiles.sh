#!/bin/bash

backupdir="dotfiles-backups/"

function make_backup() {
  if [[ -f $1 ]]; then
    filename=$(basename $1)
    cp $1 "${backupdir}${filename}"
  fi
}

function link() {
  ln -sf $1 $2
}

while true; do
  read -p "Would you like to make backups of preexisting dotfiles? [y/n] " yn

  case $yn in
    [yY] ) echo Making backups...;
      cd ~;
      mkdir -p $backupdir;

      make_backup ~/.profile;
      make_backup ~/.bashrc;
      make_backup ~/.aliases;
      make_backup ~/.config/fish/functions/aliases.fish;
      make_backup ~/.config/fish/config.fish;
      make_backup ~/.hushlogin;
      make_backup ~/.config/neofetch/config.conf;

      echo Done.;
      echo Backups saved in ~/$backupdir;
      break;;
    [nN] ) echo Backups will not be made.;
      break;;
    * ) echo Invalid response.;;
  esac
done

echo Linking Files...

# bash
link ~/dotfiles/linux/.profile ~/.profile
link ~/dotfiles/linux/.bashrc ~/.bashrc
link ~/dotfiles/linux/.aliases ~/.aliases

# fish
link ~/dotfiles/.config/fish/functions/aliases.fish ~/.config/fish/functions/aliases.fish
link ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

# misc
link ~/dotfiles/linux/.hushlogin ~/.hushlogin

# copy neofetch config instead of linking, so the user can manually configure per system w/o being tracked by git
if [[ -e ~/.config/neofetch/config.conf ]]; then
  rm ~/.config/neofetch/config.conf
fi
cp ~/dotfiles/.config/neofetch/config.conf ~/.config/neofetch/

echo Done.