#!/bin/bash

set -euxo pipefail

dnf -y install \
	rocm-hip \
	rocminfo \
	rocm-opencl \
	rocm-smi
