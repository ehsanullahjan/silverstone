#!/bin/bash

set -ouex pipefail

PACKAGES=(
    adw-gtk3-theme
    bat
    btop
    ddcutil
    distrobox
    eza
    fastfetch
    fd-find
    fzf
    grc
    lshw
    lm_sensors
    mosh
    ngrep
    nmap
    nvtop
    ripgrep
    socat
    tealdeer
    tmux
    trash-cli
    vim
    xdg-terminal-exec
    zoxide
    zsh
)
dnf -y install "${PACKAGES[@]}"
