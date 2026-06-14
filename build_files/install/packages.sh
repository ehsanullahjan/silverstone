#!/bin/bash

set -ouex pipefail

# Install packages
PACKAGES=(
    bat
    btop
    eza
    fastfetch
    fd-find
    grc
    ngrep
    nmap
    nvtop
    ripgrep
    socat
    tealdeer
    tmux
    vim
    xdg-terminal-exec
    zoxide
    zsh
)
dnf -y install "${PACKAGES[@]}"
