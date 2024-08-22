#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/helmfile/helmfile/releases/download/v1.0.0-rc.4/helmfile_1.0.0-rc.4_darwin_arm64.tar.gz

wget -qO- https://github.com/helmfile/helmfile/releases/download/v${TOOL_HELMFILE_VERSION}/helmfile_${TOOL_HELMFILE_VERSION}_${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} helmfile \
  && chmod +x  ${TARGET_BIN}/helmfile \
  && helmfile --version
