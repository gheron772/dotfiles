#!/bin/bash
# git neovim net-tools alacritty firefox noto-fonts-cjk neofetch gnome-calculator
yay -Syu kime youtube-muisc okular neovide spoofdpi google-chrome libreoffice

# dotfiles symlink
ln -s ~/dotfiles/hypr/userprefs.conf ~/.config/hypr/userprefs.conf
ln -s ~/dotfiles/chrome/chrome-flags.conf ~/.config/chrome-flags.conf

# kime
mkdir -p ~/.config/kime
ln -s ~/dotfiles/kime/config.yaml ~/.config/kime/config.yaml

# git
git config --global user.name "gheron772"
git config --global user.email "gheron772@gmail.com"
git config --global core.editor "nvim"
