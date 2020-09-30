# GNOME finalisation script.
# Don't run as root.

sudo pacman -Syu gnome
echo GNOME installed.
sudo systemctl enable gdm
sudo systemctl start gdm
