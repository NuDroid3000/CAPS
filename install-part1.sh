# Connect to your network using iwctl and then clone this repository using
# git clone https://www.github.com/Colean128/arch-provision.git

INSTALLDRIVE=/dev/sda
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

loadkeys uk
echo Loaded UK keymap. && echo

timedatectl set-ntp true
echo System clock updated. && echo

fdisk -l
echo && echo ${RED}Before saying yes, if the drive you want to install to is not /dev/sda${RESET}
echo ${GREEN}Open up the bash script and edit the INSTALLDRIVE variable.${RESET} && echo
parted $INSTALLDRIVE mklabel msdos

echo Formatted hard drive. && echo
echo Enter -1 for end.
parted $INSTALLDRIVE mkpart primary ext4 512MiB
echo Created partition.
