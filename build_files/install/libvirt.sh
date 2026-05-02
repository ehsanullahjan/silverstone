#!/bin/bash

set -ouex pipefail

dnf -y install @virtualization

systemctl enable virtqemud.service
