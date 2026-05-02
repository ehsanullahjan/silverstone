#!/bin/bash

set -ouex pipefail

cat <<-EOF >/etc/yum.repos.d/vscode.repo
	[code]
	name=Visual Studio Code
	baseurl=https://packages.microsoft.com/yumrepos/vscode
	enabled=1
	gpgcheck=1
	gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
dnf config-manager setopt code.enabled=0

dnf -y --enable-repo=code install code
