#!/usr/bin/env bash

# Inportant packages
packages=("fzf" "zoxide" "neovim" "zsh" "git" "bat" "tmux" "docker" "dnsutils" "net-tools" "flameshot" "htop" "xclip")

for package in "${packages[@]}"
do
   if pacman -Q $package > /dev/null ; then
       echo "$@ The package $package is installed"
   else
      echo "The package $package is not installed"
      sudo pacman -S $package
   fi
done

#ln -sif ~/dotfiles/.config/* ~/.config
#ln -sif ~/dotfiles/home/.* ~/
