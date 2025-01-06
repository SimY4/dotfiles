#!/usr/bin/env zsh

# Check if 'omz' command is available
if ! command -v omz &>/dev/null; then
  echo "'omz' command not found. Installing it now."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "'omz' command is already available."
  omz update
fi

# Initializing oh-my-zsh"

ln -sf "${dotfilesdir}/.zshrc" "${HOME}/.zshrc"
source "${dotfilesdir}/.zshrc"
