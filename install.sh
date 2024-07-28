#!/usr/bin/env bash

# Set the target installation directory
INSTALL_DIR="$HOME/.local/bin"

# Ensure the installation directory exists
mkdir -p "$INSTALL_DIR"

# Function to copy scripts from a specified directory
install_scripts() {
	local source_dir="$1"
	find "$source_dir" -type f ! -name 'README.org' -exec cp {} "$INSTALL_DIR" \;
}

case $1 in
	sway)
		install_scripts "wayland/sway" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		echo "Installed scripts for Sway."
		;;
	hyprland)
		install_scripts "wayland/hyprland" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		echo "Installed scripts for Hyprland."
		;;
	i3)
		install_scripts "x11/i3" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		echo "Installed scripts for i3."
		;;
	tools)
		install_scripts "tools" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		echo "Installed miscellaneous tools."
		;;
	all)
		install_scripts "wayland/sway" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		install_scripts "wayland/hyprland" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		install_scripts "x11/i3" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		install_scripts "tools" || echo "Check if you have allready a INSTALL_DIR created or corrupted."
		echo "Installed scripts for all environments."
		;;
	*)
		echo "Usage: $0 {sway|hyprland|i3|tools|all}"
		;;
esac
