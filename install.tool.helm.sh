#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://get.helm.sh/helm-v${TOOL_HELM_VERSION}-${OS}-${ARCH}.tar.gz | tar xz -C ${TARGET_BIN}/ --strip-components 1 ${OS}-${ARCH}/helm \
  && chmod +x ${TARGET_BIN}/helm
