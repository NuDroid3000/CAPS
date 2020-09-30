# INTEL GPU driver install script
# Don't run as root
# This adds vulkan support for Ivy Bridge or newer.

sudo pacman -Syu xf86-video-intel mesa lib32-mesa vulkan-intel
