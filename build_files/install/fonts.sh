#!/bin/bash

set -ouex pipefail

dnf -y copr enable che/nerd-fonts

dnf -y install \
	cascadia-code-fonts \
	fira-code-fonts \
	jetbrains-mono-fonts-all

dnf -y install nerd-fonts

sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:che:nerd-fonts.repo
