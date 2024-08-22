#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O ${TARGET_BIN}/kns https://raw.githubusercontent.com/blendle/kns/master/bin/kns \
  && chmod +x  ${TARGET_BIN}/kns \
  && wget -nv -O ${TARGET_BIN}/ktx https://raw.githubusercontent.com/blendle/kns/master/bin/ktx \
  && chmod +x  ${TARGET_BIN}/ktx \
