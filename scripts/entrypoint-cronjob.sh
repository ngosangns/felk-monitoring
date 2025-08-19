#!/bin/bash
# Entrypoint for cronjob container: run once at start, then via cron
set -e

# Run immediately at container start
/bin/bash /scripts/cron.daily

# Start cron daemon in foreground
cron -f
