#!/bin/bash

THRESHOLD=80
echo "==================== DISK MONITOR ================="
echo 
ok=0
warning=0

printf "%-25s %-8s %-8s %-8s %-8s %-8s\n" \
    "FILESYSTEM" "SIZE" "USED" "FREE" "USE%" "STATUS"

while read -r filesystem size used free percent; do
    usage=$(echo "$percent" | tr -d '%')

    if [ "$usage" -ge "$THRESHOLD" ]; then
        status="WARNING"
        ((warning++))
    else
        status="OK"
        ((ok++))
    fi

    printf "%-25s %-8s %-8s %-8s %-8s %-8s\n" \
        "$filesystem" "$size" "$used" "$free" "$percent" "$status"
done < <(df -h --output=source,size,used,avail,pcent | tail -n +2)

echo
echo "==================================================="

