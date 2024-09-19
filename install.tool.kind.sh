#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/kubernetes-sigs/kind/releases/download/v0.24.0/kind-darwin-arm64

wget -nv -O ${TARGET_BIN}/kind https://github.com/kubernetes-sigs/kind/releases/download/v${TOOL_KIND_VERSION}/kind-${OS}-${ARCH} \
  && chmod +x ${TARGET_BIN}/kind \
  && kind version
