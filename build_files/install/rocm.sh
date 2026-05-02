#!/bin/bash

set -ouex pipefail

dnf -y install \
	rocm-hip \
	rocminfo \
	rocm-opencl \
	rocm-smi \
	rocm-clinfo
