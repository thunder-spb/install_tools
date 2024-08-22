#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

NODE_ARCH=$(echo ${ARCH} | sed -e 's/amd64/x64/') \
  && mkdir -p ${TARGET_SHARE}/node-${TOOL_NODE_VERSION} \
  && wget -nv -O /tmp/nodejs.tar.gz https://nodejs.org/download/release/v${TOOL_NODE_VERSION}/node-v${TOOL_NODE_VERSION}-${OS}-${NODE_ARCH}.tar.gz \
  && tar xzf /tmp/nodejs.tar.gz -C ${TARGET_SHARE}/node-${TOOL_NODE_VERSION} --strip-components=1 \
  && rm -fv /tmp/nodejs.tar.gz \
  && ln -sf ${TARGET_SHARE}/node-${TOOL_NODE_VERSION}/bin/node ${TARGET_BIN}/node \
  && ln -sf ${TARGET_SHARE}/node-${TOOL_NODE_VERSION}/bin/npm ${TARGET_BIN}/npm \
  && node --version && npm --version
