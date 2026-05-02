#!/bin/bash

set -ouex pipefail

dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
dnf config-manager setopt docker-ce-stable.enabled=0

dnf copr -y enable atim/lazydocker
dnf config-manager setopt copr:copr.fedorainfracloud.org:atim:lazydocker.enabled=0

dnf -y --enable-repo=docker-ce-stable --enable-repo=copr:copr.fedorainfracloud.org:atim:lazydocker install \
	containerd.io \
	docker-buildx-plugin \
	docker-compose-plugin \
	docker-model-plugin \
	docker-ce \
	docker-ce-cli \
	lazydocker

systemctl enable docker.socket
