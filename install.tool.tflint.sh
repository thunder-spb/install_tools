#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O /tmp/tflint.zip https://github.com/terraform-linters/tflint/releases/download/v${TOOL_TFLINT_VERSION}/tflint_${OS}_${ARCH}.zip \
  && unzip -o /tmp/tflint.zip -d ${TARGET_BIN} \
  && rm -vf /tmp/tflint.zip \
  && chmod 755 ${TARGET_BIN}/tflint \
  && tflint -v
