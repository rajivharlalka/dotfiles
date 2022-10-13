#!/usr/bin/env bash

# Inportant packages
packages=("fzf" "zoxide" "nvim" "zsh" "git")
for package in "${packages[@]}"
do
   echo "$package"
done

#ln -sif ~/dotfiles/.config/* ~/.config
#ln -sif ~/dotfiles/home/.* ~/
