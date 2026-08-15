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
	bat
	borgbackup
	carapace
	dbus-daemon
	ddcutil
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
dnf -y install "${INCLUDED_PACKAGES[@]}"
