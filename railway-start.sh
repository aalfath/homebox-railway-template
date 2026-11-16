#!/bin/sh
# Start HomeBox on Railway's PORT, with all data on the /data volume.
set -e

# Railway routes the public domain and the health check to PORT.
export HBOX_WEB_PORT="${PORT:-${HBOX_WEB_PORT:-7745}}"

if [ -z "${HBOX_AUTH_API_KEY_PEPPER:-}" ]; then
  echo "HBOX_AUTH_API_KEY_PEPPER is not set; HomeBox refuses to start without it." >&2
  exit 1
fi

mkdir -p /data

# HomeBox writes its logs to stderr; send them to stdout so Railway
# doesn't show every line as an error (JSON lines keep their own level).
exec /app/api /data/config.yml 2>&1
