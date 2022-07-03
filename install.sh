#!/bin/bash

mkdir ~/.config
mkdir ~/.themes
cp -r dotconfig/* ~/.config
cp dotxinitrc ~/.xinitrc
cp -r dotthemes/* ~/.themes
# Installing yay and getting the required packages
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
rm -rf yay
yay -S bashtop bspwm gnome-shell kitty nvim polybar rofi sxhkd nautilus feh picom xorg-server dunst xorg-xinit nerd-fonts-fira-code ttf-font-awesome betterlockscreen flameshot firefox ntp
# Enable ntp for accurate time
sudo systemctl enable --now ntpd
#Copy the default dunst rc file to the home directory... it will change once i've made my own config
sudo cp /etc/dunst/dunstrc ~/.config/dunst/dunstrc
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
echo "PATH='$HOME/.config/rofi/bin:$PATH'" >> ~/.bashrc
cd
rm -rf Arch-config
startx
