#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

## AWS cli v1
# wget -nv -O /tmp/awscli.zip https://s3.amazonaws.com/aws-cli/awscli-bundle.zip \
#   && unzip -o /tmp/awscli.zip -d /tmp \
#   && ln -sf $(command -v python3) ${TARGET_BIN}/python \
#   && rm -f ${TARGET_BIN}/aws \
#   && /tmp/awscli-bundle/install -b ${TARGET_BIN}/aws -i ${TARGET_SHARE}/aws-cli \
#   && rm -rf /tmp/aws* \
#   && aws --version

## AWS cli v2
# wget -nv -O /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-${OS}-$(uname -m).zip \
#   && unzip -o /tmp/awscliv2.zip -d /tmp \
#   && AWSCLI_UPDATE="" \
#   && { [ -d "${TARGET_SHARE}/aws-cli" ] && AWSCLI_UPDATE="--update"; } \
#   && /tmp/aws/install --bin-dir ${TARGET_BIN} --install-dir ${TARGET_SHARE}/aws-cli ${AWSCLI_UPDATE} \
#   && rm -rf /tmp/aws* \
#   && aws --version
