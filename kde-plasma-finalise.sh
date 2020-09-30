# Colean arch provisioning finalise script for KDE Plasma
# Requires Xorg installation.
# Don't run as root

sudo pacman -Syu xorg
sudo pacman -Syu plasma
sudo pacman -Syu kde-applications
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
echo If you see this, run reboot now.
