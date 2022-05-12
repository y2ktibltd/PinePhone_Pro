# Setup wireless
sudo nmtui

# Rotate display for use with keyboard
add "fbcon=rotate:1" to end of setenv list on /boot/boot.txt

# install yay
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# configure vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl https://raw.githubusercontent.com/y2ktibltd/Vimrc-config/main/.vimrc > ~/.vimrc
  run vim then :PlugInstall

