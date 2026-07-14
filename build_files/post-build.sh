#!/bin/bash

set -ouex pipefail

# Copy custom configs
rsync -rvK /ctx/system_files/ /

# Sync shadow files
pwconv && grpconv
