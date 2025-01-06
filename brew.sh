#!/usr/bin/env zsh

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not installed. Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Attempt to set up Homebrew PATH automatically for this session
  if [ -x "/opt/homebrew/bin/brew" ]; then
    # For Apple Silicon Macs
    echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
    export PATH="/opt/homebrew/bin:$PATH"
  fi
else
  echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
  echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
  exit 1
fi

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Define an array of packages to install using Homebrew.
packages=(
  "clojure"
  "coursier"
  "gradle"
  "helix"
  "hugo"
  "maven"
  "node"
  "zsh-syntax-highlighting"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
  if brew list --formula | grep -q "^$package\$"; then
    echo "$package is already installed. Skipping..."
  else
    echo "Installing $package..."
    brew install "$package"
  fi
done

# Define an array of applications to install using Homebrew Cask.
apps=(
  "sublime-merge"
  "sublime-text"
  "ghostty"
)

# Loop over the array to install each application.
for app in "${apps[@]}"; do
  if brew list --cask | grep -q "^$app\$"; then
    echo "$app is already installed. Skipping..."
  else
    echo "Installing $app..."
    brew install --cask "$app"
  fi
done

# Install fonts
# Tap the Homebrew font cask repository if not already tapped
brew tap | grep -q "^homebrew/cask-fonts$" || brew tap homebrew/cask-fonts

fonts=(
  "font-fira-code"
  "font-iosevka"
)

for font in "${fonts[@]}"; do
  # Check if the font is already installed
  if brew list --cask | grep -q "^$font\$"; then
    echo "$font is already installed. Skipping..."
  else
    echo "Installing $font..."
    brew install --cask "$font"
  fi
done
