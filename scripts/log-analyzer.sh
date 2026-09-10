#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Usage: $0 <log_file>"
        exit 1
fi

LOG_FILE="$1"
if [ ! -f "$LOG_FILE" ]; then
	echo "Error: log file not found"
	exit 2
fi

echo "============== LOG ANALYZER ==============="
echo "Log file: $LOG_FILE"

TOTAL_LINES=$(wc -l < "$LOG_FILE")
echo "Total lines: $TOTAL_LINES"
echo "INFO: 	$(grep -c "INFO" "$LOG_FILE")"
echo "WARNING:  $(grep -c "WARNING" "$LOG_FILE")"
echo "ERROR: 	$(grep -c "ERROR" "$LOG_FILE")"
echo
echo "Top errors:"

TOP_ERROR=$(grep "ERROR" "$LOG_FILE" | sed 's/.*ERROR //' | sort | uniq -c | sort -nr | head -5 )

if [ -z "$TOP_ERROR" ]; then
	echo "No errors found."
else
	echo "$TOP_ERROR"
fi

echo "=========================================="

