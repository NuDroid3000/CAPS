# XFCE finalisation script.
# Don't run as root.

sudo pacman -Syu xorg
sudo pacman -Syu xfce4 
sudo pacman -Syu xfce4-goodies
sudo pacman -Syu sddm
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
echo If you see this, run reboot now.
