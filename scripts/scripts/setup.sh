#!/usr/bin/env sh

# symlink all folders and files in config folder to ~/.config directory
for file in $(ls -A ~/dots/config); do
    ln -sfv "$PWD/config/$file" "$HOME/.config"
done

# symlink all files in home folder to ~/
for file in $(ls -A ~/dots/home); do
    ln -sfv "$PWD/home/$file" "$HOME/$file"
done