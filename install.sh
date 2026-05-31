#!/bin/bash

echo "🚀 Installing system dependencies..."
# Core desktop packages
sudo pacman -S --needed hyprland kitty dolphin stow git github-cli swww

echo "📦 Installing AUR dependencies (Themes & Fixes)..."
# Using yay for AUR packages
paru -S --needed bibata-cursor-theme-bin

echo "🔗 Symlinking configuration files via Stow..."
cd ~/.dotfiles
stow hypr

echo "✅ Setup complete! Restart your system to see changes."
