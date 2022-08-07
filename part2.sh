#!/bin/bash

read -rp "Hostname?" hostname
read -rp "Username? (lowercase only)  " user

cat /Arch-config/pacman.conf > /etc/pacman.conf
ln -sf /usr/share/zoneinfo/NZ /etc/localtime
nvim /etc/locale.gen
locale-gen 
echo "LANG=en_NZ.UTF-8" >> /etc/locale.conf
echo "$hostname" >> /etc/hostname
systemctl enable NetworkManager
systemctl enable ntpd
useradd -m "$user"
passwd "$user"
EDITOR=nvim visudo
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
chown "$user" /Arch-config
echo "source /Arch-config/install.sh" >> /mnt/home/"$user"/.bashrc
exit
