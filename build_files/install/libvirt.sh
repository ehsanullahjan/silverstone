#!/bin/bash

set -euxo pipefail

dnf -y install @virtualization guestfs-tools bcvk
