#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O ${TARGET_BIN}/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TOOL_TERRAGRUNT_VERSION}/terragrunt_${OS}_${ARCH} \
  && chmod 755 ${TARGET_BIN}/terragrunt \
  && terragrunt -v
