#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/yannh/kubeconform/releases/download/v${TOOL_KUBECONFORM_VERSION}/kubeconform-${OS}-${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} kubeconform \
  && chmod +x ${TARGET_BIN}/kubeconform \
  && kubeconform -v
