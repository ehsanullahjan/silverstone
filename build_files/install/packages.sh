#!/bin/bash

set -ouex pipefail

# Enable copr repos
dnf copr -y enable atim/lazygit
dnf copr -y enable atim/lazydocker
dnf copr -y enable atim/starship
dnf copr -y enable lihaohong/yazi

# Enable repo for carapace
cat <<-EOF >/etc/yum.repos.d/fury.repo
	[fury]
	name=Gemfury Private Repo
	baseurl=https://yum.fury.io/rsteube/
	enabled=1
	gpgcheck=0
EOF

# Install packages
PACKAGES=(
	bat
	btop
	carapace-bin
	chezmoi
	cowsay
	# dysk
	eza
	fastfetch
	fd-find
	fortune-mod
	grc
	iostat
	iotop
	socat
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
	ugrep
	xdg-terminal-exec
	yazi
	zoxide
	zsh
)
dnf -y install "${PACKAGES[@]}"

# Disable copr repos
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:atim:lazygit.repo
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:atim:lazydocker.repo
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:atim:starship.repo
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:lihaohong:yazi.repo

# Disable other repos
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/fury.repo
