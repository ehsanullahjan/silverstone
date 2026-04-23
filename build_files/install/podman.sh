#!/bin/bash

set -ouex pipefail

dnf -y install \
	podman \
	podman-compose \
	podman-tui

systemctl enable podman.socket
