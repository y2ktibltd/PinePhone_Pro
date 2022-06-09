QTILE SETUP

# Setup wireless
    sudo nmtui
    
# Configure keyboard mapping for tty
    sudo bash -c "curl https://raw.githubusercontent.com/y2ktibltd/PinePhone_Pro/main/ppkb.map > /usr/share/kbd/keymaps/ppkb.map"
    
# Rotate display for use with keyboard
 add "fbcon=rotate:1" to end of setenv list on /boot/boot.txt
    
# Enable Sun12X12 font in fbconsole
    sudo bash -c "echo "FONT=sun12x22\nKEYMAP=/usr/share/kbd/keymaps/ppkb.map" > /etc/vconsole.conf"

# Enable battery status in bash prompt
    curl https://raw.githubusercontent.com/y2ktibltd/PinePhone_Pro/main/.bashrc > ~/.bashrc
    
# Download usb_fix.sh
    curl https://raw.githubusercontent.com/y2ktibltd/PinePhone_Pro/main/usb_charge_fix.sh > ~/usb_fix.sh
    
# download .xinitrc
    curl https://raw.githubusercontent.com/y2ktibltd/PinePhone_Pro/main/.xinitrc > ~/.xinitrc

# install software
    sudo pacman -S --needed git ppkb-tools vim base-devel curl htop tmux neofetch locate xorg xorg-xinit && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# configure vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
    curl https://raw.githubusercontent.com/y2ktibltd/Vimrc-config/main/.vimrc > ~/.vimrc;

# change power button function
    sudo vim /etc/systemd/logind.conf   -> change HandlePowerKey=suspend
