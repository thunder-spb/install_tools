#!/bin/bash
set -euxo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/databus23/helm-diff/releases/download/v3.9.9/helm-diff-macos-arm64.tgz

{ [ "${OS}" = "darwin" ] && OS="macos" || true; }
HELMSSM_NAME="helm-ssm-${OS}"
HELM_PLUGIN_DIR="$(helm env | grep HELM_PLUGINS | cut -d\" -f2)/helm-diff"
mkdir -p ${HELM_PLUGIN_DIR}

wget -qO- https://github.com/databus23/helm-diff/releases/download/v${TOOL_HELM_DIFF_VERSION}/helm-diff-${OS}-${ARCH}.tgz | tar xz -C ${HELM_PLUGIN_DIR} \
  && chmod +x ${HELM_PLUGIN_DIR}
