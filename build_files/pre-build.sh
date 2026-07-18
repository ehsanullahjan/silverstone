#!/bin/bash

set -euxo pipefail

# Enable dnf config-manager
dnf -y install 'dnf5-command(config-manager)' rsync

# Copy custom configs
rsync -rvK /ctx/system_files/ /
