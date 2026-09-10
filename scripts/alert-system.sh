#!/bin/bash

SERVICE_MONITOR="$(dirname "$0")/service-monitor.sh"
DISK_MONITOR="$(dirname "$0")/disk-monitor.sh"

DISK_OUTPUT=$("$DISK_MONITOR")
echo "================ ALERT SYSTEM ==============="
echo
OUTPUT=$("$SERVICE_MONITOR")
echo "Checking alerts..."
exit_code=0
DISK_ALERT_COUNT=$(echo "$DISK_OUTPUT" | grep -c "WARNING")
ALERT_COUNT=$(echo "$OUTPUT" | grep -c "STOPPED")

DISK_ALERT=$(echo "$DISK_OUTPUT" | grep "WARNING")
SERVICE_ALERT=$(echo "$OUTPUT" | grep "STOPPED")

if [ "$DISK_ALERT_COUNT" -gt 0 ]; then
	echo
	echo "[ALERT] $DISK_ALERT_COUNT disk(s) require attention."
	echo "$DISK_ALERT"
	exit_code=1
else
	echo
	echo "[OK] No disk alerts"
fi

if [ "$ALERT_COUNT" -gt 0 ]; then
	echo "[ALERT] $ALERT_COUNT service(s) require attention."
	echo "$SERVICE_ALERT"
	exit_code=1
else
	echo "[OK] No services alerts."
fi
echo
echo "============================================="
exit "$exit_code"
