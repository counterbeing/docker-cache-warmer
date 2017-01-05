#!/usr/bin/env bash

debug() {
  if [[ ! -z $DEBUG ]]; then
    MSG="[docker-cache-warmer] DEBUG $@"
    echo $MSG | tee -a /job.log
  fi
}

info() {
  MSG="[docker-cache-warmer] $@"
  echo $MSG | tee -a /job.log
}

debug "Debugging is enabled $(date)"

