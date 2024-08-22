#!/bin/bash
set -euo pipefail
SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))
source ${SCRIPT_PATH}/install.tools.versions.sh

wget -qO- https://github.com/terraform-docs/terraform-docs/releases/download/v${TOOL_TFDOCS_VERSION}/terraform-docs-v${TOOL_TFDOCS_VERSION}-${OS}-${ARCH}.tar.gz | tar xzv -C ${TARGET_BIN}/ terraform-docs \
  && chmod 755 ${TARGET_BIN}/terraform-docs \
  && echo 'IyEvYmluL2Jhc2gKCnNldCAtZQoKY29tbWFuZCAtdiB0ZXJyYWZvcm0tZG9jcyB8fCB7IGVjaG8gIkVSUk9SOiB0ZXJyYWZvcm0tZG9jcyBpcyBub3QgYXZhaWxhYmxlIjsgZXhpdCAxOyB9CgpfUEFSQU1FVEVSUz0kQAoKUEFSQU1FVEVSUz0ke19QQVJBTUVURVJTOi0ufQoKdGVycmFmb3JtLWRvY3MgbWFya2Rvd24gLS1zb3J0LWJ5IHJlcXVpcmVkIC0tb3V0cHV0LWZpbGUgUkVBRE1FLm1kICR7UEFSQU1FVEVSU30KCg==' | base64 -d > ${TARGET_BIN}/tfdocs \
  && chmod +x ${TARGET_BIN}/tfdocs \
  && terraform-docs -v
