#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

OC_NAME="openshift-client-${OS}" \
  && { [ "${ARCH}" = "arm64" ] && OC_NAME="${OC_NAME}-${ARCH}" || true; } \
  && mkdir -p  ${TARGET_SHARE}/openshift-client \
  && wget -qO- https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${TOOL_OC_VERSION}/${OC_NAME}.tar.gz | tar xz -C ${TARGET_BIN} oc \
  && chmod +x  ${TARGET_BIN}/oc \
  && oc version --client
