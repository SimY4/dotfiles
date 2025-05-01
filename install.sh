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
find .config -type f -exec echo "Linking {}..." \; -exec ln -sf $dotfilesdir/{} $HOME/{} \;

# Define an array of dotfiles
dotfiles=(
  ".ideavimrc"
)

# Loop over the array to link into HOME.
for dotfile in "${dotfiles[@]}"; do
  echo "Linking $dotfile..."
  ln -sf $dotfilesdir/$dotfile $HOME/$dotfile
done

echo "Installation Complete!"
