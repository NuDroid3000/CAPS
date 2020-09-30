
# Open Source NVIDIA GPU driver install script
# Don't run as root
# THESE ARE NOT RECOMMENDED, IT IS RECOMMENDED TO USE THE CLOSED SOURCE NVIDIA DRIVERS
# to use the nvidia drivers put nvidia at the top instead of nouveau.

sudo pacman -Syu xf86-video-nouveau mesa lib32-mesa
