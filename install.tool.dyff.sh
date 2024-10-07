#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# A diff tool for YAML files, and sometimes JSON
# https://github.com/homeport/dyff/releases/download/v1.9.2/dyff_1.9.2_darwin_arm64.tar.gz

wget -qO- https://github.com/homeport/dyff/releases/download/v${TOOL_DYFF_VERSION}/dyff_${TOOL_DYFF_VERSION}_${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} dyff \
  && chmod +x  ${TARGET_BIN}/dyff \
  && dyff version
