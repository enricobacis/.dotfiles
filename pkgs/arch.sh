#!/bin/bash

# exit on first error
set -e

# enable echo mode
set -x

# list of packages to install
PKGS=(
  alsa-utils  # Advanced Linux Sound Architecture (contains amixer)
  dmenu       # lightweight dynamic menu for X
  dunst       # minimalistic notification daemon
  git         # well.. git
  pkgfile     # tool for searching files from packages
  stow        # symlink utility to (also) manage dotfiles
  the_silver_searcher  # ag
  tmux        # terminal multiplexer
  vim         # again, well.. vim
  zip unzip   # zip
)

# install the packages
for PKG in ${PKGS[@]}; do
  pacman -S --needed --noconfirm $PKG
done

# enable services
systemctl enable pkgfile-update.timer
