# Install Part 2 script.
# Set variables below for hostnames and other shit.

HOSTNAME=nd3k-archbox
INSTALLDRIVE=/dev/sda
MIRROR=https://raw.githubusercontent.com/NuDroid3000/CAPS/master
#MIRROR=https://ap.colean.cc/m
FINALISE=blackbox

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

pacman -Syu doas
echo Installed doas.
echo 'permit :wheel' >> /etc/doas.conf

useradd -m -G wheel nd3k
echo "nd3k:password" | chpasswd
echo login details are nd3k password

curl -L ${MIRROR}/${FINALISE}-finalise.sh >> finalise.sh
