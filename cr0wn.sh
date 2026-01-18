#!/bin/bash
#                       █████
#                     ███░░░███
#  ██████  ████████  ███   ░░███ █████ ███ █████ ████████
# ███░░███░░███░░███░███    ░███░░███ ░███░░███ ░░███░░███
#░███ ░░░  ░███ ░░░ ░███    ░███ ░███ ░███ ░███  ░███ ░███
#░███  ███ ░███     ░░███   ███  ░░███████████   ░███ ░███
#░░██████  █████     ░░░█████░    ░░████░████    ████ █████
# ░░░░░░  ░░░░░        ░░░░░░      ░░░░ ░░░░    ░░░░ ░░░░░
#
# Credits: Natano Ledger (tech@accountt.ru)
# This is the installation script for https://github.com/frozen-infinity/Crown.git rice
# Star the repo if you find it useful!

# Install dependencies
echo "Installing dependencies"
sudo pacman -Sy btop iwd python networkmanager bluez cmatrix swaybg hyprpaper kitty wofi lsd mako neovim waybar pamixer starship ttf-jetbrains-mono-nerd git
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
echo "Switching to NetworkManager with iwd backend"
sudo systemctl stop wpa_supplicant.service
sudo systemctl disable wpa_supplicant.service
sudo echo "[device]" >>/etc/NetworkManager/conf.d/wifi_backend.conf
sudo echo "wifi.backend=iwd" >>/etc/NetworkManager/conf.d/wifi_backend.conf

sudo systemctl enable NetworkManager
sudo systemctl restart NetworkManager
echo "Installing dependencies from AUR"
yay -S eww peaclock sfetch pipes.sh blueberry
sudo pacman -R niri # We will reaplce niri with a fork with blur support
# Buid niri with blur support (this is not mine, taken from https://www.reddit.com/r/niri/comments/1l8mj0k/for_those_who_cant_wait_anymore_for_blur_here_is/)
echo "Building dependencies"
git clone --branch feat/blur --single-branch https://github.com/visualglitch91/niri.git
cd niri
cargo build --release
sudo cp target/release/niri /bin/
sudo chmod 777 /bin/niri
curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardVPNCLI/HEAD/scripts/release/install.sh | sh -s -- -v
cd
sudo cp /bin/kitty /bin/kittyterminal
sudo chmod 777 /bin/kittyterminal
git clone https://github.com/Roonil/WayVes
cd WayVes
mkdir -p build/objects
make
sudo make install

# Download configuration files
echo "Applying configurations"
cd
git clone https://github.com/frozen-infinity/Crown.git
git clone https://github.com/frozen-infinity/WayVes-config.git
mkdir ~/.config/ # If not already created
#mkdir -p ~/.config/hypr
#mkdir ~/.config/waybar/
#mkdir ~/.config/eww/
#mkdir ~/.config/kitty/
#mkdir ~/.config/wofi/
#mkdir ~/.config/mako/
#mkdir ~/.config/nvim/
#mkdir ~/.config/niri/
#mkdir ~/.config/btop
cd Crown
cp -r btop eww hypr kitty lsd mako niri nvim waybar wofi ~/.config/
cp starship.toml ~/.config/
cp start_vol.sh start_wifi.sh girl.png girly.png gb.jpg opendock.sh ~
cd
mv WayVes-config ~/.config/WayVes/
mv ~/WayVes/shaders/utils/ ~/.config/WayVes/
chmod +x start_vol.sh start_wifi.sh opendock.sh
chmod +x ~/.config/eww/scripts/get_audio_devices.sh ~/.config/eww/scripts/set_audio_device.sh ~/.config/eww/wifi_menu/* ~/.config/eww/wifi_connection/*
chmod +x ~/.config/waybar/scripts/*
chmod +x ~/.config/waybar/*
chmod +x ~/.config/niri/scripts/*
chmod +x ~/.config/eww/wifi_menu/scripts/*
chmod +x ~/.config/eww/wifi_connection/*

echo "Installation done! You may need to reboot and wait a bit for NetworkManager to load correctly, then the WiFi menu will work great"
echo "Login into your AdGuard VPN account (adguardvpn-cli login)"
echo ""
echo "If you have any issues, please open an issue on https://github.com/frozen-infinity/Crown/issues"
