#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O /tmp/tf.zip https://releases.hashicorp.com/terraform/${TOOL_TF_VERSION}/terraform_${TOOL_TF_VERSION}_${OS}_${ARCH}.zip \
  && unzip -o /tmp/tf.zip -d ${TARGET_BIN} \
  && rm -vf /tmp/tf.zip \
  && chmod 755 ${TARGET_BIN}/terraform \
  && mkdir -p ~/.terraform.d/plugins \
  && terraform -v
