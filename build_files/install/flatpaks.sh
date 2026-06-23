#!/bin/bash

set -ouex pipefail

# Disable Fedora flatpak remote
systemctl disable flatpak-add-fedora-repos.service

# Enable Flathub flatpak remote
systemctl enable flathub-init.service
systemctl enable flatpak-preinstall.service
