#!/usr/bin/env zsh

dotfilesdir="$(pwd)"

# Run the MacOS Script
./macOS.sh

# Run the Oh My ZSH Script
./oh-my-z.sh

# Run the Homebrew Script
./brew.sh

# Initializing .config"
find .config -type d -exec mkdir -p $HOME/{} \;
find .config -type f -exec ln -sf $dotfilesdir/{} $HOME/{} \;

echo "Installation Complete!"
