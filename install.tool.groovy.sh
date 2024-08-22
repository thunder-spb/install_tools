#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -nv -O /tmp/groovy.zip https://archive.apache.org/dist/groovy/${TOOL_GROOVY_VERSION}/distribution/apache-groovy-binary-${TOOL_GROOVY_VERSION}.zip \
  && unzip -o /tmp/groovy.zip -d ${TARGET_SHARE}/ \
  && rm -fv /tmp/groovy.zip \
  && ln -sf ${TARGET_SHARE}/groovy-${TOOL_GROOVY_VERSION}/bin/groovy ${TARGET_BIN}/groovy \
  && ln -sf ${TARGET_SHARE}/groovy-${TOOL_GROOVY_VERSION}/bin/groovyc ${TARGET_BIN}/groovyc \
  && ln -sf ${TARGET_SHARE}/groovy-${TOOL_GROOVY_VERSION}/bin/grape ${TARGET_BIN}/grape \
  && groovy -version
