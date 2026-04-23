#!/bin/bash

set -ouex pipefail

sudo dnf -y install @virtualization

systemctl enable virtqemud.service
