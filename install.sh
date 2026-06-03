#!/bin/bash

echo "🚀 Installing system dependencies..."
sudo pacman -S --needed --noconfirm hyprland kitty dolphin stow git awww rofi hyprshot waybar pavucontrol ttf-jetbrains-mono-nerd polkit-kde-agent hyprsunset nwg-look hyprlock wlogout mako signal-desktop ark

echo "Installing Brave Origin Beta browser..."
curl -fsS https://dl.brave.com/install.sh | FLAVOR=origin CHANNEL=beta sh

echo "Installing Mullvad VPN..."
sudo pacman -S --needed --noconfirm mullvad-vpn
sudo systemctl enable --now mullvad-daemon

echo "📦 Installing AUR dependencies (Themes & Fixes)..."
paru -S --needed apple_cursor qt6ct-kde

echo "🔗 Symlinking configuration files via Stow..."
cd ~/.dotfiles
stow hypr waybar mako rofi kitty fastfetch wlogout

echo "Configuring system display manager..."
sudo pacman -S --needed --noconfirm sddm
sudo systemctl enable sddm

sudo mkdir -p /usr/share/backgrounds/
if [ -f "$HOME/.dotfiles/hypr/.config/hypr/wallpaper.png" ]; then
    sudo cp "$HOME/.dotfiles/hypr/.config/hypr/wallpaper.png" /usr/share/backgrounds/login-bg.jpg
fi

sudo tee /etc/sddm.conf > /dev/null << 'EOF'
[Theme]
Current=maui
CursorTheme=macOS

[Users]
DefaultBackground=/usr/share/backgrounds/login-bg.jpg

[Autologin]
Session=hyprland
EOF

echo "✅ Setup complete!"

echo "Restarting in 5..."
sleep 1
echo "Restarting in 4..."
sleep 1
echo "Restarting in 3..."
sleep 1
echo "Restarting in 2..."
sleep 1
echo "Restarting in 1..."
sleep 1
systemctl reboot
