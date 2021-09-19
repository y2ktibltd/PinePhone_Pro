#!/bin/bash
useradd -mG wheel $1
passwd $1
pacman -Syu htop tmux base-devel  git curl  xorg xterm cmake nano vim

cd /opt
git clone https://aur.archlinux.org/yay-git.git

chown -R $1:$1 ./yay-git

cd yay-git
makepkg -si

yay -S qtile python-setuptools
