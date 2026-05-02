#!/bin/bash

set -ouex pipefail

dnf -y config-manager addrepo --from-repofile https://www.scootersoftware.com/scootersoftware.repo
dnf config-manager setopt scootersoftware.enabled=0

dnf -y --enable-repo=scootersoftware install bcompare
