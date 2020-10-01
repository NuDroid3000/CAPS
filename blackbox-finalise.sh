# blackbox finalise script
# Don't run as root.

sudo pacman -Syu xorg xorg-xinit blackbox xterm
echo 'exec blackbox' >> ~/.xinitrc
echo 'if [[ "$(tty)" = "/dev/tty1" ]]; then' >> ~/.bash_profile
echo '  exec startx' >> ~/.bash_profile
echo 'fi' >> ~/.bash_profile
echo You can now reboot the system into blackbox.
