#!/bin/bash

set -ouex pipefail

# Install packages
PACKAGES=(
    bat
    btop
    ddcutil
    distrobox
    eza
    fastfetch
    fd-find
    fzf
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
