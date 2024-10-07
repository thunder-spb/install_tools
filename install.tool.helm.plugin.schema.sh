#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

# https://github.com/dadav/helm-schema/releases/download/0.14.1/helm-schema_0.14.1_Darwin_arm64.tar.gz

HELM_PLUGIN_DIR="$(helm env | grep HELM_PLUGINS | cut -d\" -f2)/helm-schema"
mkdir -p ${HELM_PLUGIN_DIR}

wget -qO- https://github.com/dadav/helm-schema/releases/download/${TOOL_HELM_SCHEMA_VERSION}/helm-schema_${TOOL_HELM_SCHEMA_VERSION}_${OS}_${ARCH}.tar.gz | tar xz -C ${HELM_PLUGIN_DIR} \
  && chmod +x ${HELM_PLUGIN_DIR}

cat > ${HELM_PLUGIN_DIR}/plugin.yaml <<EOF
name: "schema"
# Version is the version of Helm plus the number of official builds for this
# plugin
version: "${TOOL_HELM_SCHEMA_VERSION}"
usage: "Generate JSON Schema based on values.yaml. Docs: https://github.com/dadav/helm-schema/blob/main/README.md"
description: "Generate JSON Schema based on values.yaml. Docs: https://github.com/dadav/helm-schema/blob/main/README.md"
useTunnel: true
command: "$HELM_PLUGIN_DIR/helm-schema"
EOF
