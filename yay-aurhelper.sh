# yay install script
# Don't run as root

sudo pacman -Syu base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sci
cd ~
