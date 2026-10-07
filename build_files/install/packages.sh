#!/bin/bash

set -euxo pipefail

EXCLUDED_PACKAGES=(
	gnome-system-monitor
	ptyxis
	toolbox
)
dnf -y remove "${EXCLUDED_PACKAGES[@]}"

INCLUDED_PACKAGES=(
	adw-gtk3-theme
	alacritty
	autofs
	bat
	carapace
	chezmoi
	dbus-daemon
	distrobox
	dysk
	eza
	fastfetch
	fd-find
	fzf
	grc
	ripgrep
	starship
	tealdeer
	tmux
	trash-cli
	vim
	xdg-terminal-exec
	zoxide
	zsh
)
dnf -y --enable-repo terra install "${INCLUDED_PACKAGES[@]}"
