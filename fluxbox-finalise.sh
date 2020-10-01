sudo pacman -Syu xorg xorg-xinit fluxbox xterm
echo 'exec startfluxbox' >> ~/.xinitrc
echo 'if [[ "$(tty)" = "/dev/tty1" ]]; then' >> ~/.bash_profile
echo '  exec startx' >> ~/.bash_profile
echo 'fi' >> ~/.bash_profile
echo You can now reboot the system into fluxbox.
