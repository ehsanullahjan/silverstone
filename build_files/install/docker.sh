#!/bin/bash

set -ouex pipefail

dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/docker-ce.repo

dnf -y install --enable-repo=docker-ce-stable \
	containerd.io \
	docker-buildx-plugin \
	docker-compose-plugin \
	docker-model-plugin \
	docker-ce \
	docker-ce-cli

systemctl enable docker.socket
