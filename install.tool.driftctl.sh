#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/snyk/driftctl/releases/download/v0.40.0/driftctl_darwin_arm64

wget -nv -O ${TARGET_BIN}/driftctl https://github.com/snyk/driftctl/releases/download/v${TOOL_DRIFTCTL_VERSION}/driftctl_${OS}_${ARCH} \
  && chmod 755 ${TARGET_BIN}/driftctl \
  && driftctl version
