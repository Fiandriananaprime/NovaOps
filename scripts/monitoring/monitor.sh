#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

clear

echo "=================================="
echo "        NOVAOPS MONITOR"
echo "=================================="
echo
echo "1. System information"
echo "2. Process Monitor"
echo "3. Exit"

read -p "Choose an option: " choice

case "$choice" in
    1)
        "$SCRIPT_DIR/system-info.sh"
        ;;
    2)
        "$SCRIPT_DIR/process-monitor.sh"
        ;;
    3)
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac

read -p "Press Enter to return to menu..."
