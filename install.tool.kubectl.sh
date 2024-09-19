#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://dl.k8s.io/release/v1.31.0/bin/darwin/amd64/kubectl
info "Installing kubectl v${TOOL_KUBECTL_VERSION}..."
wget -nv -O ${TARGET_BIN}/kubectl https://dl.k8s.io/release/v${TOOL_KUBECTL_VERSION}/bin/${OS}/${ARCH}/kubectl \
  && chmod +x ${TARGET_BIN}/kubectl \
  && ln -sf ${TARGET_BIN}/kubectl ${TARGET_BIN}/k \
  && kubectl version --client

## Install kubectl convert plugin: https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-kubectl-convert-plugin
info "Installing kubectl convert plugin v${TOOL_KUBECTL_VERSION}..."
wget -nv -O ${TARGET_BIN}/kubectl-convert https://dl.k8s.io/release/v${TOOL_KUBECTL_VERSION}/bin/${OS}/${ARCH}/kubectl-convert \
  && chmod +x ${TARGET_BIN}/kubectl-convert
