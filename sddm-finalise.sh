# SDDM finalisation script.
# Don't run as root.

sudo pacman -Syu xorg
sudo pacman -Syu sddm
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
echo Please install a DE or WM before rebooting.
