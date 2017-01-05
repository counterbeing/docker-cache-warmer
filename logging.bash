#!/usr/bin/env bash

debug() {
  if [[ ! -z $DEBUG ]]; then
    echo "[docker-cache-warmer] DEBUG$@"
  fi
}

info() {
  echo "[docker-cache-warmer] $@"
}

debug "Debugging is enabled $(date)"

