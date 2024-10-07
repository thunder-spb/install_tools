#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/norwoodj/helm-docs/releases/download/v1.14.2/helm-docs_1.14.2_Darwin_arm64.tar.gz

HELM_PLUGIN_DIR="$(helm env | grep HELM_PLUGINS | cut -d\" -f2)/helm-docs"
mkdir -p ${HELM_PLUGIN_DIR}

wget -qO- https://github.com/norwoodj/helm-docs/releases/download/v${TOOL_HELM_DOCS_VERSION}/helm-docs_${TOOL_HELM_DOCS_VERSION}_${OS}_${ARCH}.tar.gz | tar xz -C ${HELM_PLUGIN_DIR} \
  && chmod +x ${HELM_PLUGIN_DIR}

cat > ${HELM_PLUGIN_DIR}/plugin.yaml <<EOF
name: "docs"
# Version is the version of Helm plus the number of official builds for this
# plugin
version: "${TOOL_HELM_DOCS_VERSION}"
usage: "Generate docs from values.yaml. Docs: https://github.com/norwoodj/helm-docs/blob/master/README.md"
description: "Generate docs from values.yaml. Docs: https://github.com/norwoodj/helm-docs/blob/master/README.md"
useTunnel: true
command: "$HELM_PLUGIN_DIR/helm-docs"
EOF
