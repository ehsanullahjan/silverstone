#!/bin/bash

set -ouex pipefail

rpm --import https://downloads.1password.com/linux/keys/1password.asc
cat <<-EOF >/etc/yum.repos.d/1password.repo
	[1password]
	name=1Password Stable Channel
	baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
	enabled=1
	gpgcheck=1
	repo_gpgcheck=1
	gpgkey="https://downloads.1password.com/linux/keys/1password.asc"
EOF
dnf config-manager setopt 1password.enabled=0

# Ensure 1pass post-install scripts can find the groups during build
groupadd -r -g 31001 onepassword
groupadd -r -g 31002 onepassword-mcp

# Create sysusers.d entries for 1password groups
cat <<-EOF >/usr/lib/sysusers.d/1password.conf
	g onepassword 31001 -
	g onepassword-mcp 31002 -
EOF

dnf -y --enable-repo=1password install 1password 1password-cli
