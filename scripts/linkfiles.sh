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
      make_backup ~/.bash_aliases;
      make_backup ~/.config/alacritty/alacritty.yml;
      make_backup ~/.config/fish/functions/aliases.fish;
      make_backup ~/.config/fish/config.fish;
      make_backup ~/.hushlogin;
      make_backup ~/.config/neofetch/config.conf;
      make_backup ~/.gitignore;

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
link ~/dotfiles/.profile ~/.profile
link ~/dotfiles/.bashrc ~/.bashrc
link ~/dotfiles/.bash_aliases ~/.bash_aliases

# alacritty
link ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# nvim
link ~/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
link ~/dotfiles/.config/nvim/lua/ ~/.config/nvim/

# fish
link ~/dotfiles/.config/fish/functions/aliases.fish ~/.config/fish/functions/aliases.fish
link ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

# misc
link ~/dotfiles/.hushlogin ~/.hushlogin
link ~/dotfiles/.gitignore ~/.gitignore

# copy neofetch config instead of linking, so the user can manually configure per system w/o being tracked by git
if [[ -e ~/.config/neofetch/config.conf ]]; then
  rm ~/.config/neofetch/config.conf
fi
cp ~/dotfiles/.config/neofetch/config.conf ~/.config/neofetch/

echo Done.
