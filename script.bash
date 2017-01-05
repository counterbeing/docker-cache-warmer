#!/usr/bin/env bash

source logging.bash

debug "Clearing out log"
cat /dev/null >/job.log

warm_host() {
  debug "Warming host $1"
  echo "$ASSET_PATHS" | sed 's/^/$1/' | xargs -n1 warm_file
}

warm_file() {
  debug "Warming file $1"
  curl -a 'cache warmer' -ksl $1 > /dev/null 2>&1
}

info "Started executing at $(date)"

ASSET_PATHS=$(curl -a 'cache warmer' -ksl $ASSET_PATH_MANIFEST_URL)
HOSTS_LIST=$($HOSTS_COMMAND)
echo $HOSTS_LIST | xargs -n1 warm_host

