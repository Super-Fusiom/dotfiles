#!/bin/bash

cp -r * ~/.config

# Installing yay and getting the required packages
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd 
rm -rf yay
yay -S bspwm kitty polybar rofi sxhkd thunar

