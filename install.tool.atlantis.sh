#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/runatlantis/atlantis/releases/download/v0.28.5/atlantis_darwin_arm64.zip

wget -nv -O /tmp/atlantis.zip https://github.com/runatlantis/atlantis/releases/download/v${TOOL_ATLANTIS_VERSION}/atlantis_${OS}_${ARCH}.zip \
  && unzip -o /tmp/atlantis.zip -d ${TARGET_BIN} atlantis \
  && rm -rvf /tmp/atlantis.zip \
  && chmod 755 ${TARGET_BIN}/atlantis \
  && atlantis --version
