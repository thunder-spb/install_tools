#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

## https://github.com/charmbracelet/gum/releases/download/v0.14.3/gum_0.14.3_Darwin_arm64.tar.gz

wget -qO- https://github.com/charmbracelet/gum/releases/download/v${TOOL_GUM_VERSION}/gum_${TOOL_GUM_VERSION}_${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} --strip-components 1 gum_${TOOL_GUM_VERSION}_${OS_CAPITALIZED}_${ARCH}/gum \
  && chmod +x ${TARGET_BIN}/gum \
  && gum --version
