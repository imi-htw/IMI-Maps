#!/usr/bin/env bash
set -eo pipefail

source "$(dirname "$0")/helpers"

docker_build() {
  declare desc="build docker image"
  local TAG="$1"; shift
  local REPO_SLUG="$REPO_SLUG"
}

main() {
  declare desc="main function"
}

main "$@"
