#!/bin/bash

set -ouex pipefail

EXCLUDED_PACKAGES=(
    gnome-system-monitor
    ptyxis
)
dnf -y remove "${EXCLUDED_PACKAGES[@]}"

INCLUDED_PACKAGES=(
    adw-gtk3-theme
    alacritty
    bat
    btop
    ddcutil
    distrobox
    et
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
dnf -y install "${INCLUDED_PACKAGES[@]}"
