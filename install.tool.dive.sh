#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/wagoodman/dive/releases/download/v${TOOL_DIVE_VERSION}/dive_${TOOL_DIVE_VERSION}_${OS}_${ARCH}.tar.gz | tar xzv -C ${TARGET_BIN}/ dive \
  && chmod 755 ${TARGET_BIN}/dive \
  && dive -v
