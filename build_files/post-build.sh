#!/bin/bash

set -euxo pipefail

# Sync shadow files
pwconv && grpconv

# Copy custom configs
rsync -rvK /ctx/system_files/post-build/ /

# Disable main terra repo
dnf config-manager setopt terra.enabled=0
