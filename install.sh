#!/bin/bash

mkdir ~/.config
cp -r dotconfig/* ~/.config
cp dotxinitrc ~/.xinitrc

# Installing yay and getting the required packages
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
rm -rf yay
yay -S bspwm kitty polybar rofi sxhkd thunar nitrogen picom xorg-server xorg-xinit nerd-fonts-fira-code ttf-font-awesome betterlockscreen flameshot
#Ask what GPU is used for proper drivers
while true; do
    read -p "Do you use an amd (AMD) or nvidia (NVIDIA) gpu or is this a virtual machine(VM)?" nav
    if [ $nav == 'NVIDIA' ] || [ $nav == 'Nvidia' ] || [ $nav == 'nvidia' ] ; then 
        yay -S nvidia nvidia-utils; break
    elif [ $nav == 'AMD' ] || [ $nav == 'amd' ] || [ $nav == 'Amd' ] ; then
        yay -S xf86-video-amdgpu; break
    elif [ $nav == 'vm' ] || [ $nav == 'VM' ] || [ $nav == 'Vm' ] ; then
        yay -S virtualbox-guest-utils; sudo systemctl enable --now vboxservice; break
    else
        echo 'Wrong choice, use either nvidia, amd or vm'
    fi
done
