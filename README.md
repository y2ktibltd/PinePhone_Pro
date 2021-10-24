# PinePhone

wget https://github.com/dreemurrs-embedded/Pine64-Arch/releases/download/20211022/archlinux-pinephone-barebone-20211022.img.xz

xz -d -v archlinux-pinephone-barebone-20211022.img.xz

sudo dd if=/home/tom/Downloads/archlinux-pinephone-barebone-20211022.img of=/dev/sda status=progress && sync

curl https://github.com/y2ktibltd/PinePhone/blob/main/Arch/setup.sh>~/setup.sh && chmod +x setup.sh && sudo ./setup.sh

