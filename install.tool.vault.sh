#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://releases.hashicorp.com/vault/1.17.3/vault_1.17.3_darwin_arm64.zip

wget -nv -O /tmp/vault.zip https://releases.hashicorp.com/vault/${TOOL_VAULT_VERSION}/vault_${TOOL_VAULT_VERSION}_${OS}_${ARCH}.zip \
  && unzip -o /tmp/vault.zip -d ${TARGET_BIN} vault \
  && rm -rvf /tmp/vault.zip \
  && chmod 755 ${TARGET_BIN}/vault \
  && vault version
