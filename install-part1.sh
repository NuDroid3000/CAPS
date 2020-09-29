# Connect to your network using iwctl and then clone this repository using
# git clone https://www.github.com/Colean128/arch-provision.git

INSTALLDRIVE=/dev/sda

loadkeys uk
echo Loaded UK keymap.

timedatectl set-ntp true
echo System clock updated.

fdisk -l
echo Before saying yes, if the drive you want to install to is not /dev/sda
echo Open up the bash script and edit the INSTALLDRIVE variable.
parted $INSTALLDRIVE mklabel msdos

echo Formatted hard drive.
echo Enter -1 for end.
parted $INSTALLDRIVE mkpart primary ext4 512MiB
echo Created partition.

print fart
