#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

## Install get-all: https://github.com/corneliusweig/ketall/releases/download/v1.3.8/get-all-arm64-darwin.tar.gz
info "Installing kubectl get-all plugin v${TOOL_KUBECTL_GETALL_VERSION}..."
DOWNLOAD_URL="https://github.com/corneliusweig/ketall/releases/download/v${TOOL_KUBECTL_GETALL_VERSION}/get-all-${ARCH}-${OS}.tar.gz"
info "Downloading ${DOWNLOAD_URL}..."
wget -qO- ${DOWNLOAD_URL} | tar xz -C ${TARGET_BIN} get-all-${ARCH}-${OS} \
  && chmod +x ${TARGET_BIN}/get-all-${ARCH}-${OS} \
  && mv -f ${TARGET_BIN}/get-all-${ARCH}-${OS} ${TARGET_BIN}/kubectl-get_all \
  && kubectl get-all version
