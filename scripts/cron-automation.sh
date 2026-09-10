#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

NOVAOPS="$PROJECT_DIR/novaops.sh"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/alerts.log"

mkdir -p "$LOG_DIR"

DATE=$(date "+%Y-%m-%d %H:%M:%S")

"$NOVAOPS" alerts >> "$LOG_FILE" 2>&1

STATUS=$?

if [ "$STATUS" -eq 1 ]; then
    echo "[$DATE] Alert detected." >> "$LOG_FILE"
fi

exit "$STATUS"
