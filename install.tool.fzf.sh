#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/junegunn/fzf/releases/download/v0.54.3/fzf-0.54.3-linux_amd64.tar.gz

wget -qO- https://github.com/junegunn/fzf/releases/download/v${TOOL_FZF_VERSION}/fzf-${TOOL_FZF_VERSION}-${OS}_${ARCH}.tar.gz | tar xz -C ${TARGET_BIN} fzf \
  && chmod +x  ${TARGET_BIN}/fzf \
  && fzf --version
