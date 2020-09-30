# pacaur Install script
# Don't run as root

sudo pacman -Syu base-devel git
git clone https://aur.archlinux.org/auracle-git.git
cd auracle-git
makepkg -sci
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -sci
echo 'export EDITOR=$(which nano)' >> ~/.bashrc
cd ~
