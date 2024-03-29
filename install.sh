#!/usr/bin/env bash

# xorg display server installation
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Window Manager
sudo apt install -y i3-wm suckless-tools 

# Network File Tools/System Events
sudo apt install -y dialog avahi-daemon acpi acpid gvfs-backends

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Terminal (eg. kitty)
sudo apt install -y kitty

# FlameShot 
sudo apt install -y flameshot

# Zsh
sudo apt install -y zsh
## zsh-autosuggestions
mkdir ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k

## To set zsh as default shell run (and inform the user password) 
# chsh -y -s /bin/zsh

# Exa and Bat
sudo apt install -y exa bat

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer

# Brightness control
sudo apt install -y brightnessctl

# Neofetch
sudo apt install -y neofetch

# Network Manager
sudo apt install -y network-manager

# Iwd
sudo apt install -y iwd

# Browser Installation (eg. chromium)
sudo apt install -y firefox-esr

# Desktop background browser/handler
sudo apt install -y feh

# Printing and bluetooth
sudo apt install -y cups system-config-printer simple-scan
sudo apt install -y bluez blueman

## Breaking blueman-tray
sudo mv /usr/bin/blueman-tray /usr/bin/-break-blueman-tray

sudo systemctl enable cups
sudo systemctl enable bluetooth

# Packages needed for window manager installation
sudo apt install -y picom rofi dunst libnotify-bin unzip

# playerctl
sudo apt install -y playerctl

# xclip
sudo apt install -y xclip

# Install ly Display Manager
sudo apt install -y build-essential libpam0g-dev libxcb-xkb-dev
git clone --recurse-submodules https://github.com/fairyglade/ly ~/.ly
(cd ~/.ly && make)
(cd ~/.ly && sudo make install installsystemd)
sudo systemctl enable ly.service

########################################################
# End of script for default config
#

# Moving wallpapers
mkdir ~/Imagens/wallpapers
cp ~/bookworm-scripts/resources/wallpapers/* ~/Imagens/wallpapers/ 

# Moving config files
cp -r ~/bookworm-scripts/resources/config-files/* ~/.config/

# Install NerdFonts
bash ~/bookworm-scripts/resources/scripts/nerdfonts.sh

# Moving shell config files
cp ~/bookworm-scripts/resources/shell/.zshrc ~/bookworm-scripts/resources/shell/.p10k.zsh ~/

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thank you.\e[0m\n"
