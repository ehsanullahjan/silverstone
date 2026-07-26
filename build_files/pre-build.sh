#!/bin/bash

set -euxo pipefail

# Copy custom configs
rsync -rvK /ctx/system_files/pre-build/ /

# Enable dnf config-manager
dnf -y install 'dnf5-command(config-manager)'

# Install terra repos
dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' \
	terra-release \
	terra-gpg-keys \
	terra-release-mesa
