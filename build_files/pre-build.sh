#!/bin/bash

set -euxo pipefail

# Enable dnf config-manager
dnf -y install 'dnf5-command(config-manager)'

# Copy custom configs
rsync -rvK /ctx/system_files/pre-build/ /

# Install main terra repo
dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
