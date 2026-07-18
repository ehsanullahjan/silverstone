#!/bin/bash

set -euxo pipefail

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

# 1password et al. are relatively misbehaved packages, in particular on atomic distributions. Out of
# the box, the 1password app fails to communicate with its companion CLI and (browser) extension.
# Furthermore, due to group ID drift on atomic distros, even assuming a user syncs 1Password groups
# to /etc/group, relevant files under /opt/1Password end up being inaccessible, breaking the apps or
# their integration. Therefore, we must manually create groups with IDs that are consistent across
# builds both when building and at runtime.

# Ensure install scripts can find 1password groups during build
groupadd -r -g 31001 onepassword
groupadd -r -g 31002 onepassword-mcp
groupadd -r -g 31003 onepassword-cli

# Create sysusers.d entries to persist 1password groups
cat <<-EOF >/usr/lib/sysusers.d/1password.conf
	g onepassword 31001 -
	g onepassword-mcp 31002 -
	g onepassword-cli 31003 -
EOF

dnf -y --enable-repo=1password install 1password 1password-cli
