# PinePhone_Pro

add "fbcon=rotate:1" to end of setenv list on /boot/boot.txt

# install yay
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
