#!/bin/bash

set -ouex pipefail

dnf -y install \
	podlet \
	podman \
	podman-compose \
	podman-tui

systemctl enable podman.socket
systemctl enable podman-auto-update.timer
