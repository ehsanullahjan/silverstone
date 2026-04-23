#!/bin/bash

set -ouex pipefail

dnf -y config-manager addrepo --from-repofile https://www.scootersoftware.com/scootersoftware.repo
sed -i "s/enabled=.*/enabled=0/g" /etc/yum.repos.d/scootersoftware.repo

dnf -y install --enable-repo=scootersoftware bcompare
