#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/microsoft/go-sqlcmd/releases/download/v${TOOL_SQLCMD_VERSION}/sqlcmd-${OS}-${ARCH}.tar.bz2 | tar xz -C ${TARGET_BIN} sqlcmd \
  && chmod +x  ${TARGET_BIN}/sqlcmd \
  && sqlcmd --version
