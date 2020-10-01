# Install Part 2 script.
# Set variables below for hostnames and other shit.

HOSTNAME=provisioned-system
INSTALLDRIVE=/dev/sda
MIRROR=https://raw.githubusercontent.com/Colean128/arch-provision/master
#MIRROR=https://ap.colean.cc/m
FINALISE=gnome
GRAPHICSVENDOR=amd
AURHELPER=pacaur

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
echo Set clock using timezone.

rm /etc/locale.gen
echo en_GB.UTF-8 UTF-8 >> /etc/locale.gen
echo en_GB ISO-8859-1 >> /etc/locale.gen
echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo en_US ISO-8859-1 >> /etc/locale.gen
locale-gen
echo Generated locales.

rm /etc/locale.conf
echo LANG=en_GB.UTF-8 >> /etc/locale.conf
echo Set locale.

rm /etc/vconsole.conf
echo KEYMAP=uk >> /etc/vconsole.conf
echo Permanently set UK keymap.

echo $HOSTNAME >> /etc/hostname
echo Set hostname to ${HOSTNAME}.

echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 ${HOSTNAME}.localdomain ${HOSTNAME} >> /etc/hosts
echo Hosts folder set.

pacman -Syu grub
echo Installed GRUB package.

grub-install --target=i386-pc $INSTALLDRIVE
grub-mkconfig -o /boot/grub/grub.cfg
echo Installed GRUB.

pacman -Syu sudo
echo Installed sudo.

echo Enter your username.
read username
useradd -m -G wheel $username

echo Enter password.
passwd $username

curl -L ${MIRROR}/${FINALISE}-finalise.sh >> finalise.sh
curl -L ${MIRROR}/${GRAPHICSVENDOR}-gpudrivers.sh >> gpudrivers.sh
curl -L ${MIRROR}/${AURHELPER}-aurhelper.sh >> aurhelper.sh
echo exit the chroot and reboot the machine.
echo Run systemctl start NetworkManager and then run setup sudo by editing /etc/sudoers using nano
