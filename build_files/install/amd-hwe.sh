#!/bin/bash

set -euxo pipefail

dnf -y install rocm-smi rocminfo
dnf -y install libva-utils mesa-va-drivers
