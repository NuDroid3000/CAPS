# Colean arch provisioning finalise script for KDE Plasma
# Requires Xorg installation.
# Don't run as root

sudo pacman -Syu xorg
sudo pacman -Syu plasma
sudo pacman -Syu kde-applications
echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then' >> ~/.bash_profile
echo 'exec startx' >> ~/.bash_profile
echo 'fi' >> ~/.bash_profile
echo 'export DESKTOP_SESSION=plasma' >> ~/.xinitrc
echo 'exec startplasma-x11' >> ~/.xinitrc
xinit
