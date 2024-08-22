#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O ${TARGET_BIN}/yq https://github.com/mikefarah/yq/releases/download/v${TOOL_YQ_VERSION}/yq_${OS}_${ARCH} \
  && chmod +x ${TARGET_BIN}/yq \
  && yq --version
