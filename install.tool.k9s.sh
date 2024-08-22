#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Darwin_arm64.tar.gz
OS="$(tr '[:lower:]' '[:upper:]' <<< ${OS:0:1})${OS:1}"

wget -qO- https://github.com/derailed/k9s/releases/download/v${TOOL_K9S_VERSION}/k9s_${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} k9s \
  && chmod +x  ${TARGET_BIN}/k9s \
  && k9s version
