#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- http://archive.apache.org/dist/maven/maven-3/${TOOL_MAVEN_VERSION}/binaries/apache-maven-${TOOL_MAVEN_VERSION}-bin.tar.gz | tar xzf - -C ${TARGET_SHARE} \
  && chmod +x ${TARGET_SHARE}/apache-maven-${TOOL_MAVEN_VERSION}/bin/mvn \
  && rm -f /usr/bin/mvn \
  && ln -sf ${TARGET_SHARE}/apache-maven-${TOOL_MAVEN_VERSION}/bin/mvn ${TARGET_BIN}/mvn \
  && mvn --version
