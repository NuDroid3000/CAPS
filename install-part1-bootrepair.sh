# Connect to your network using iwctl and then clone this repository using
# git clone https://www.github.com/Colean128/arch-provision.git

INSTALLDRIVE=/dev/sda
INSTALLPARTITION=/dev/sda1
KERNEL=linux

mount ${INSTALLPARTITION} /mnt
pacstrap /mnt base ${KERNEL}
arch-chroot /mnt grub-install --target=i386-pc $INSTALLDRIVE
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

echo Boot repair complete.
