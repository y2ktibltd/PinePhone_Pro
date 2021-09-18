#!/bin/bash
useradd -mG wheel $1
passwd $1
pacman -Syu htop tmux base-devel qtile git curl python-setuptools xorg xterm cmake nano vim

cd /opt
git clone https://aur.archlinux.org/yay-git.git

chown -R $1:$1 ./yay-git

cd yay-git
makepkg -si

