#!/bin/bash

read -rp "Hostname?" hostname
read -rp "Username? (lowercase only)  " user

ln -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
nvim /etc/locale.gen
locale-gen 
echo "LANG=en_NZ.UTF-8" >> /etc/locale.conf
echo "$hostname" >> /etc/hostname
systemctl enable dhcpcd
systemctl enable ntpd
useradd -m "$user"
passwd "$user"
EDITOR=nvim visudo
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=LE GRUB
grub-mkconfig -o /boot/grub/grub.cfg
chown "$user" /Arch-config
echo "source /Arch-config/install.sh" >> /mnt/home/"$user"/.bashrc
exit
