#!/usr/bin/env zsh

dotfilesdir="$(pwd)"

# Run the MacOS Script
./macOS.sh

# Run the Oh My ZSH Script
./oh-my-z.sh

# Run the Homebrew Script
./brew.sh

# Run settings sync
./settings.sh

echo "Installation Complete!"
