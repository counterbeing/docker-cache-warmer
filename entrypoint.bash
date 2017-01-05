#!/usr/bin/env bash

source logging.bash

if [[ $CRON_SCHEDULE == "now" ]]; then
  info "Running the job now"
  bash /script.bash
else
  debug "Scheduling cron job"

  echo "$CRON_SCHEDULE bash /script.bash" >> cron_job
  crontab cron_job

  touch /job.log

  debug "Waiting to trigger cron job"
  tail -f /job.log

fi
