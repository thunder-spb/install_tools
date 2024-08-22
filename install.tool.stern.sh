#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/stern/stern/releases/download/v${TOOL_STERN_VERSION}/stern_${TOOL_STERN_VERSION}_${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} stern \
  && chmod +x  ${TARGET_BIN}/stern \
  && stern --version
