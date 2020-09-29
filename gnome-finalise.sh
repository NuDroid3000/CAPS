# GNOME finalisation script.

sudo pacman -Syu gnome
echo GNOME installed.
sudo systemctl enable gdm
sudo systemctl start gdm
