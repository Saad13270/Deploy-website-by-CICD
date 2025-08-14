#!/bin/bash
# Apache installation script for Ubuntu 24.04
# Run this script as root or with sudo

set -e

echo "🔄 Updating package list..."
sudo apt update -y

echo "⬆️ Upgrading installed packages..."
sudo apt upgrade -y

echo "📦 Installing Apache2..."
sudo apt install apache2 -y

echo "⚙️ Enabling Apache to start at boot..."
sudo systemctl enable apache2

echo "▶️ Starting Apache service..."
sudo systemctl start apache2

echo "✅ Checking Apache status..."
sudo systemctl status apache2 --no-pager

echo "🌐 Allowing HTTP & HTTPS traffic through UFW firewall..."
sudo ufw allow 'Apache Full'

echo "📍 Apache installed successfully!"
echo "You can check by visiting: http://$(hostname -I | awk '{print $1}')"

