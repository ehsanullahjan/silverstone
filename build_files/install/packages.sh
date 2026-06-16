#!/bin/bash

set -ouex pipefail

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
    lshw
    lm_sensors
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
