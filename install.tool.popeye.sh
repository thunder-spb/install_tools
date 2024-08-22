#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/derailed/popeye/releases/download/v${TOOL_POPEYE_VERSION}/popeye_${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} popeye \
  && chmod +x  ${TARGET_BIN}/popeye \
  && popeye version
