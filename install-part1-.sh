# Connect to your network using iwctl and then clone this repository using
# git clone https://www.github.com/Colean128/arch-provision.git

INSTALLDRIVE=/dev/sda
INSTALLPARTITION=/dev/sda1
KERNEL=linux
MIRROR=https://raw.githubusercontent.com/Colean128/CAPS/master
#MIRROR=https://ap.colean.cc/m
PART2OPTIONS=

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
pacstrap /mnt nano neofetch man-db man-pages networkmanager
echo Installed some essential packages.
genfstab -U /mnt >> /mnt/etc/fstab
echo Fstab generated.

curl -L ${MIRROR}/install-part2-${PART2OPTIONS}.sh > /mnt/install-part2.sh
curl -L ${MIRROR}/nm.sh > /mnt/nm.sh
echo Use arch-chroot /mnt to chroot into the environment
echo run sh nm.sh if you need wifi and then run sh install-part2.sh
