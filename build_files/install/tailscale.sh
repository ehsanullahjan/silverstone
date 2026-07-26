#!/bin/bash

set -euxo pipefail

dnf -y install tailscale
systemctl enable tailscaled.service
