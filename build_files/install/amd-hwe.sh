#!/bin/bash

set -euxo pipefail

dnf -y install terra-release-mesa
dnf -y install mesa-dri-drivers mesa-va-drivers mesa-vulkan-drivers

dnf config-manager setopt terra-mesa.enabled=0
