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
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/1password.repo

dnf -y install --enable-repo=1password 1password
