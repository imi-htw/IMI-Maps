#!/usr/bin/env bash

is_travis() {
  declare description="check if the script runs under Travis"
  if [[ "$TRAVIS" == "true" ]]; then
    true
  else
    false
  fi
}

is_release() {
  declare description="checks if the current build is a relase"
  if is_travis; then
    if [[ ! -n "$TRAVIS_TAG" ]]  && [[ "$TRAVIS_BRANCH" == "master" ]]; then
      echo "STAGING RELEASE"
      true
    elif [[ -n "$TRAVIS_TAG" ]] && [[ "$TRAVIS_BRANCH" == "$TRAVIS_TAG" ]]; then
      echo "PRODUCTION / TAGGED RELEASE"
      true
    else
      echo "Do not know, what to do"
      false
    fi
  else
    true
  fi
}

is_release
