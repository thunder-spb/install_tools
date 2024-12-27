#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

## Install images: https://github.com/chenjiandongx/kubectl-images/releases/download/v0.6.3/kubectl-images_darwin_arm64.tar.gz
info "Installing kubectl images plugin v${TOOL_KUBECTL_IMAGES_VERSION}..."
wget -qO- https://github.com/chenjiandongx/kubectl-images/releases/download/v${TOOL_KUBECTL_IMAGES_VERSION}/kubectl-images_${OS}_${ARCH}.tar.gz  | tar xz -C ${TARGET_BIN} kubectl-images \
  && chmod +x ${TARGET_BIN}/kubectl-images \
  && kubectl images --version
