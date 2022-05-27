# Setup wireless
    sudo nmtui

# install keyboard driver
    sudo pacman -Syu ppkb-tools;
    sudo curl https://raw.githubusercontent.com/y2ktibltd/PinePhone_Pro/main/ppkb.map > /usr/share/kbd/keymaps/ppkb.map
    
# Rotate display for use with keyboard
 add "fbcon=rotate:1" to end of setenv list on /boot/boot.txt
    
# Enable Sun12X12 font in fbconsole
    sudo echo "FONT=sun12x22\nKEYMAP=/usr/share/kbd/keymaps/ppkb.map" > /etc/vconsole.conf

# Enable battery status in bash prompt
    curl https://raw.githubusercontent.com/y2ktibltd/PinePhone_Pro/main/.bashrc > ~/.bashrc

# install yay
    pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# configure vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
    curl https://raw.githubusercontent.com/y2ktibltd/Vimrc-config/main/.vimrc > ~/.vimrc;

# change power button function
    sudo vim /etc/systemd/logind.conf   -> change HandlePowerKey=suspend

# install xorg
    sudo pacman -Syu xorg xorg-xinit
    
