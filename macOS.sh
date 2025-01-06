#!/usr/bin/env zsh

xcode-select --install

echo "Complete the installation of Xcode Command Line Tools before proceeding."
echo "Press enter to continue..."
read

defaults write -g NSUserKeyEquivalents -dict-add \
  Top    '~^\\U2191' \
  Bottom '~^\\U2193' \
  Left   '~^\\U2190' \
  Right  '~^\\U2192' \
  Center '~^c' \
  Fill   '~^f' \
  'Move to Built-in Retina Display' '@~^\\U2190' \
  'Move to DELL U2723QE' '@~^\\U2192'
