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

dnf -y --enable-repo=1password install 1password
