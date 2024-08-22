#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/weaveworks/eksctl/releases/download/v${TOOL_EKSCTL_VERSION}/eksctl_$(uname -s)_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} \
  && chmod +x ${TARGET_BIN}/eksctl \
  && eksctl version
