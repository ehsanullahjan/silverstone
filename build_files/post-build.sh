#!/bin/bash

set -euxo pipefail

# Sync shadow files
pwconv && grpconv

# Copy custom configs
rsync -rvK /ctx/system_files/post-build/ /

# Disable terra repos
dnf config-manager setopt terra.enabled=0
dnf config-manager setopt terra-mesa.enabled=0
