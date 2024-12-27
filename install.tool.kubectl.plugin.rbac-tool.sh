#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

## Install rbac-toolplugin: https://github.com/alcideio/rbac-tool/releases/download/v1.19.0/rbac-tool_v1.19.0_darwin_arm64.tar.gz
info "Installing kubectl rbac-tool plugin v${TOOL_KUBECTL_RBAC_TOOL_VERSION}..."
wget -qO- https://github.com/alcideio/rbac-tool/releases/download/v${TOOL_KUBECTL_RBAC_TOOL_VERSION}/rbac-tool_v${TOOL_KUBECTL_RBAC_TOOL_VERSION}_${OS}_${ARCH}.tar.gz  | tar xz -C ${TARGET_BIN} rbac-tool \
  && mv -f ${TARGET_BIN}/rbac-tool ${TARGET_BIN}/kubectl-rbac_tool \
  && ln -sf ${TARGET_BIN}/kubectl-rbac_tool ${TARGET_BIN}/rbac-tool \
  && chmod +x ${TARGET_BIN}/kubectl-rbac_tool \
  && kubectl rbac-tool version
