#!/usr/bin/env bash
#set -euo pipefail
IFS=$' '
DIRNAME="$(dirname "$0")"

function findDeps() {
  [ -z $1 ] && exit 0
  DEPS=$(jsonnet-deps -J "vendor" $1)
  echo $DEPS
  echo $DEPS | recurse
}
function recurse() {
  while read DEP;
    do
      findDeps $DEP
  done
}

findDeps $1 | jsonnet -S -A pwd=$PWD "${DIRNAME}"/imports.jsonnet | jsonnetfmt -
