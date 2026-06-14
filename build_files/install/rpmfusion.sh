#!/bin/bash

set -ouex pipefail

# Enable RPMfusion and other repo(s) it requires
dnf config-manager setopt fedora-cisco-openh264.enabled=1
dnf -y install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable appstream for RPMFusion
dnf -y install rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data

# note: updating @multimedia doesn't work on `fedora-silverblue`, so we explicitly list pkgs to install
# >>> dnf -y update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# Enable add'l multimedia codecs
dnf -y swap ffmpeg-free ffmpeg --allowerasing
dnf -y install --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin \
    gstreamer1-plugins-bad-freeworld \
    gstreamer1-plugins-ugly \
    libheif-freeworld \
    pipewire-codec-aptx

# Enable hw-accel for AMD hardware
dnf -y install mesa-va-drivers-freeworld

dnf config-manager setopt \
    fedora-cisco-openh264.enabled=0 \
    rpmfusion-free.enabled=0 \
    rpmfusion-free-updates.enabled=0 \
    rpmfusion-nonfree.enabled=0 \
    rpmfusion-nonfree-updates.enabled=0
