#!/bin/bash

set -euxo pipefail

# Sync shadow files
pwconv && grpconv

# Copy custom configs
rsync -rvK /ctx/system_files/post-build/ /
