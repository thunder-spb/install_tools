#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O /tmp/kubelogin.zip https://github.com/Azure/kubelogin/releases/download/v${TOOL_KUBELOGIN_VERSION}/kubelogin-${OS}-${ARCH}.zip \
  && unzip -o /tmp/kubelogin.zip -d ${TARGET_BIN} bin/${OS}_${ARCH}/kubelogin \
  && mv -f ${TARGET_BIN}/bin/${OS}_${ARCH}/kubelogin ${TARGET_BIN}/ \
  && rm -rvf ${TARGET_BIN}/bin /tmp/kubelogin.zip \
  && chmod 755 ${TARGET_BIN}/kubelogin \
  && kubelogin --version
