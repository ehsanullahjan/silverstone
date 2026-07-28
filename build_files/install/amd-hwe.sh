#!/bin/bash

set -euxo pipefail

dnf -y install mesa-va-drivers
dnf -y install rocm-smi rocminfo
