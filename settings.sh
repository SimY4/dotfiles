#!/usr/bin/env zsh

dotfilesdir="$(pwd)"

# Initializing .config"
find .config -type d -exec mkdir -p $HOME/{} \;
find .config -type f -exec echo "Linking {}..." \; -exec ln -sf $dotfilesdir/{} $HOME/{} \;

# Initializing Sublime product configs
for product in text merge; do
  packages="${HOME}/Library/Application Support/Sublime ${(C)product}/Packages"
  echo "Linking sublime/$product/User..."
  mkdir -p "$packages"
  # A real User dir (not a symlink) would make ln nest the link inside it, so back it up.
  if [[ -d "$packages/User" && ! -L "$packages/User" ]]; then
    mv "$packages/User" "$packages/User.bak.$(date +%s)"
  fi
  ln -sfn "$dotfilesdir/sublime/$product/User" "$packages/User"
done

# Define an array of dotfiles
dotfiles=(
  ".gitconfig"
  ".ideavimrc"
)

# Loop over the array to link into HOME.
for dotfile in "${dotfiles[@]}"; do
  echo "Linking $dotfile..."
  ln -sf $dotfilesdir/$dotfile $HOME/$dotfile
done
