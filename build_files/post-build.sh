#!/bin/bash

set -ouex pipefail

# Sync shadow files
pwconv && grpconv
