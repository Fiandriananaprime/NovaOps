#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

BACKUP_DIR="$PROJECT_DIR/backups"
SOURCE_DIR="$PROJECT_DIR/logs"

if [ ! -d "$SOURCE_DIR" ]; then
	echo "Error: source directory not found"
	exit 1
fi

mkdir -p "$BACKUP_DIR"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/novaops_backup_$DATE.tar.gz"

TOTAL_SIZE=$(du -sb "$SOURCE_DIR" | cut -f1)

echo "================= BACKUP MANAGER =========="
echo
echo "Source : $SOURCE_DIR"
echo "Backup : $BACKUP_FILE"
echo "Starting backup..."
echo

if tar -czf - "$SOURCE_DIR" | pv  > "$BACKUP_FILE"; then
    if tar -tzf "$BACKUP_FILE" >/dev/null 2>&1; then
        echo
        echo "Backup completed successfully."
    else
        echo
        echo "Backup failed: archive corrupted."
        rm -f "$BACKUP_FILE"
        exit 2
    fi
else
    echo
    echo "Backup failed."
    rm -f "$BACKUP_FILE"
    exit 2
fi
BACKUP_COUNT=$(find "$BACKUP_DIR" -name "novaops_backup_*.tar.gz" | wc -l)

if [ "$BACKUP_COUNT" -gt 5 ]; then
	 find "$BACKUP_DIR" -name "novaops_backup_*.tar.gz" -printf '%T@ %p\n' |
        sort -n |
        head -n -5 |
        cut -d' ' -f2- |
        xargs -r rm
fi


