# Connect to your network using iwctl and then clone this repository using
# git clone https://www.github.com/Colean128/arch-provision.git

INSTALLDRIVE=/dev/sda
INSTALLPARTITION=/dev/sda1
KERNEL=linux-hardened
MIRROR=https://raw.githubusercontent.com/NuDroid3000/CAPS/master
#MIRROR=https://ap.colean.cc/m

loadkeys uk
echo Loaded UK keymap. && echo

timedatectl set-ntp true
echo System clock updated. && echo

fdisk -l
echo Before saying yes, if the drive you want to install to is not /dev/sda
echo Open up the bash script and edit the INSTALLDRIVE variable.
parted $INSTALLDRIVE mklabel msdos

echo Formatted hard drive. && echo
echo Enter -1 for end.
parted $INSTALLDRIVE mkpart primary ext4 512MiB
echo Created partition.

mkfs.ext4 $INSTALLPARTITION
echo Formatted partition.
mount $INSTALLPARTITION /mnt
echo Mounted partition.
pacstrap /mnt base ${KERNEL} linux-firmware
echo Installed Linux kernel.
pacstrap /mnt vim man-db man-pages networkmanager
echo Installed some essential packages.
genfstab -U /mnt >> /mnt/etc/fstab
echo Fstab generated.

curl -L ${MIRROR}/install-part2-nd3k.sh > /mnt/install-part2.sh
curl -L ${MIRROR}/nm.sh > /mnt/nm.sh
arch-chroot /mnt sh install-part2.sh
arch-chroot /mnt doas systemctl enable NetworkManager
arch-chroot /mnt doas -u nd3k sh finalise.sh
