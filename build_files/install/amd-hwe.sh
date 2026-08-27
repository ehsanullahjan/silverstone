#!/bin/bash

set -euxo pipefail

dnf -y install mesa-dri-drivers mesa-va-drivers mesa-vulkan-drivers
