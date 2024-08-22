#!/bin/bash

SCRIPT_PATH=$(dirname $(readlink -f "${BASH_SOURCE:-$0}"))

ARCH=$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
OS_CAPITALIZED=$(tr '[:lower:]' '[:upper:]' <<< ${OS:0:1})${OS:1}
case "$OS" in
  # Msys support
  msys*) OS='windows';;
  # Minimalist GNU for Windows
  mingw*) OS='windows';;
esac

TARGET_BIN=${TARGET_BIN:-}
[ -z $TARGET_BIN ] && TARGET_BIN=~/.local/bin
TARGET_SHARE=${TARGET_SHARE:-}
[ -z $TARGET_SHARE ] && TARGET_SHARE=~/.local/share

[ "${OS}" == "windows" ] && {
  TARGET_BIN="/c/Users/$(whoami | cut -d'+' -f2)/bin"
  TARGET_SHARE="/c/Users/$(whoami | cut -d'+' -f2)/share"
}

mkdir -p ${TARGET_BIN} ${TARGET_SHARE}

error() {
  echo "[FATAL] ${0}: ${1}" >&2;
  exit 1;
}

info() {
  echo "[INFO] ${0}: ${1}";
}

check_utils() {
  command -v unzip || error "Unable to unzip"
  command -v tar || error "Unable to tar/untar"
}
