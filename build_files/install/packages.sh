#!/bin/bash

set -ouex pipefail

# Install packages
PACKAGES=(
	bat
	btop
	carapace-bin
	chezmoi
	cowsay
	eza
	fastfetch
	fd-find
	fortune-mod
	grc
	iostat
	iotop
	ngrep
	neovim
	nicstat
	nmap
	nvtop
	ripgrep
	socat
	tealdeer
	tmux
	trash-cli
	xdg-terminal-exec
	zoxide
	zsh
)
dnf -y install "${PACKAGES[@]}"
