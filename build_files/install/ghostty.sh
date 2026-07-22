#!/bin/bash

set -euxo pipefail

dnf copr -y enable scottames/ghostty
dnf config-manager setopt copr:copr.fedorainfracloud.org:scottames:ghostty.enabled=0

dnf -y --enable-repo=copr:copr.fedorainfracloud.org:scottames:ghostty install ghostty
