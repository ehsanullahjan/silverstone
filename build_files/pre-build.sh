#!/bin/bash

set -ouex pipefail

# Enable dnf config-manager
dnf -y install 'dnf5-command(config-manager)' rsync

# Copy custom configs
rsync -rvK /ctx/system_files/ /
