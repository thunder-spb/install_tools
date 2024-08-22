#!/bin/bash

set -euo pipefail

SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))

source ${SCRIPT_PATH}/install.tools.versions.sh

INSTALL_FILES=$(ls -1 install.tool.*.sh)

for INSTALL_FILE in ${INSTALL_FILES}; do
  source ${SCRIPT_PATH}/${INSTALL_FILE}
done
