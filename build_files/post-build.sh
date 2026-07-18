#!/bin/bash

set -euxo pipefail

# Sync shadow files
pwconv && grpconv
