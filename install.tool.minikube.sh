#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

## https://github.com/kubernetes/minikube/releases/download/v1.33.1/minikube-darwin-amd64

wget -nv -O ${TARGET_BIN}/minikube https://github.com/kubernetes/minikube/releases/download/v${TOOL_MINIKUBE_VERSION}/minikube-${OS}-${ARCH} \
  && chmod 755 ${TARGET_BIN}/minikube \
  && minikube version
