#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O ${TARGET_BIN}/kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/${TOOL_KUBECTL_VERSION}/bin/${OS}/${ARCH}/kubectl \
  && chmod +x ${TARGET_BIN}/kubectl \
  && ln -sf ${TARGET_BIN}/kubectl ${TARGET_BIN}/k \
  && kubectl version --client
