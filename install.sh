#!/bin/bash
if [ "$USER" == 'root' ] ; then
    reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
    lsblk
    read -rp "Disk to install?  " disk     
    timedatectl set-ntp true 
    cfdisk "$disk"
    read -rp "root partition number?  " rroot
    read -rp "efi partition number?  " refi
    mkfs.ext4 "${disk}${rroot}" 
    mkfs.fat -F32 "${disk}${refi}" 
    mount "${disk}${rroot}" /mnt 
    mkdir /mnt/boot /mnt/boot/efi
    mount "${disk}${refi}" /mnt/boot/efi
    # Getting correct ucode 
    while true; do
        read -rp "AMD or Intel CPU?   " cpu
        if [ "$cpu" == 'Intel' ] || [ "$cpu" == 'intel' ] || [ "$cpu" == 'INTEL' ] ; then
            code="intel-ucode"
            break
        elif [ "$cpu" == 'amd' ] || [ "$cpu" == 'Amd' ] || [ "$cpu" == 'AMD' ] ; then
            code="amd-ucode"
            break
        else
           echo "Wrong choice, use AMD or Intel"
        fi
    done
    pacstrap /mnt base base-devel linux linux-firmware ntp networkmanager grub efibootmgr zsh archlinux-keyring neovim git fontconfig pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack pamixer "$code"
    genfstab -U /mnt >> /mnt/etc/fstab
    mv /root/Arch-config/part2.sh /mnt
    chmod +x /mnt/part2.sh
    cp -r /root/Arch-config /mnt 
    arch-chroot /mnt /bin/bash /part2.sh
    rm /mnt/part2.sh
    reboot;
else
    cd /Arch-config
    mkdir ~/.config ~/.local ~/.local/bin ~/.local/share ~/.local/share/backgrounds ~/.local/share/fonts ~/.local/share/themes
    cp -r dotconfig/* ~/.config
    cp dotxinitrc ~/.xinitrc
    cp -r dotlocal/share/themes/* ~/.local/share/themes
    cp -r dotlocal/share/backgrounds/* ~/.local/share/backgrounds
    cp -r dotlocal/share/fonts/* ~/.local/share/fonts
    cp -r dotlocal/bin/* ~/.local/bin
    # Apply new fonts
    fc-cache -vf
    # Installing yay and getting the required packages
    cd
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd
    rm -rf yay
    # Install le packages
    yay -S btop polkit bspwm alacritty polybar rofi sxhkd nautilus feh picom xorg-server dunst xorg-xinit nerd-fonts-fira-code ttf-font-awesome betterlockscreen flameshot firefox wget xdg-ninja mpv mpd ani-cli visual-studio-code-bin pfetch man-db papirus-icon-theme xdg-user-dirs discord ncmpcpp youtube-dl yt-dlp
    xdg-user-dirs-update 
    # Enable and start MPD
    systemctl --user enable --now mpd
    #Ask what GPU is used for proper drivers
    while true; do
        read -rp "Do you use an amd (AMD) or nvidia (NVIDIA) gpu or is this a virtual machine(VM)?   " nav
        if [ "$nav" == 'NVIDIA' ] || [ "$nav" == 'Nvidia' ] || [ "$nav" == 'nvidia' ] ; then
            yay -S nvidia nvidia-utils; break
        elif [ "$nav" == 'AMD' ] || [ "$nav" == 'amd' ] || [ "$nav" == 'Amd' ] ; then
            yay -S xf86-video-amdgpu; break
        elif [ "$nav" == 'vm' ] || [ "$nav" == 'VM' ] || [ "$nav" == 'Vm' ] ; then
            yay -S virtualbox-guest-utils; sudo systemctl enable --now vboxservice; break
        else
            echo 'Wrong choice, use either nvidia, amd or vm'
        fi
    done
    # Install oh my zsh
    cd 
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    ./install.sh
    rm install.sh
    echo /Arch-config/aliases.txt >> ~/.zshrc
    cd
    rm -rf /Arch-config
    startx
fi
