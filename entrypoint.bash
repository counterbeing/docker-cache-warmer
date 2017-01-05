#!/usr/bin/env bash

source logging.bash

echo "$CRON_SCHEDULE bash /script.bash" >> cron_job
crontab cron_job

touch /job.log

tail -f /job.log
