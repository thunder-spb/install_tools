#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

HELMSSM_NAME="helm-ssm-${OS}"
{ [ "${ARCH}" = "arm64" ] && HELMSSM_NAME="${HELMSSM_NAME}-arm" || true; }
HELM_PLUGIN_DIR="$(helm env | grep HELM_PLUGINS | cut -d\" -f2)/helm-ssm"
mkdir -p ${HELM_PLUGIN_DIR}

wget -qO- https://github.com/codacy/helm-ssm/releases/download/${TOOL_HELM_SSM_VERSION}/${HELMSSM_NAME}.tgz | tar xz -C ${HELM_PLUGIN_DIR} \
  && chmod +x ${HELM_PLUGIN_DIR}/helm-ssm
