#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

rsync -rvK /ctx/system_files/ /

/ctx/build_files/install/1password.sh
/ctx/build_files/install/bcompare.sh
/ctx/build_files/install/vscode.sh

/ctx/build_files/install/docker.sh
/ctx/build_files/install/podman.sh
/ctx/build_files/install/libvirt.sh
/ctx/build_files/install/rocm.sh

/ctx/build_files/install/carapace.sh
/ctx/build_files/install/dysk.sh
/ctx/build_files/install/fonts.sh
/ctx/build_files/install/git.sh
/ctx/build_files/install/starship.sh
/ctx/build_files/install/yazi.sh
/ctx/build_files/install/packages.sh

/ctx/build_files/cleanup.sh
