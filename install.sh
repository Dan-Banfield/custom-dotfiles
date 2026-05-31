#!/bin/bash

echo "🚀 Installing system dependencies..."
sudo pacman -S --needed hyprland kitty dolphin stow git swww rofi hyprshot waybar

echo "📦 Installing AUR dependencies (Themes & Fixes)..."
paru -S --needed bibata-cursor-theme-bin

echo "🔗 Symlinking configuration files via Stow..."
cd ~/.dotfiles
stow hypr waybar

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
