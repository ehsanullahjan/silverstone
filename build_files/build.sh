#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

/ctx/install/1password.sh
/ctx/install/bcompare.sh
/ctx/install/vscode.sh

/ctx/install/docker.sh
/ctx/install/podman.sh
/ctx/install/libvirt.sh
/ctx/install/rocm.sh

/ctx/install/carapace.sh
/ctx/install/dysk.sh
/ctx/install/fonts.sh
/ctx/install/git.sh
/ctx/install/starship.sh
/ctx/install/yazi.sh
/ctx/install/packages.sh

/ctx/cleanup.sh
