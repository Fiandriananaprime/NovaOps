
#!/bin/bash

SERVICES=("nginx" "postgresql" "ssh" "docker")

check_service() {
    local service="$1"

    if systemctl cat "$service" >/dev/null 2>&1; then
        local status
        status=$(systemctl is-active "$service" 2>/dev/null)

        case "$status" in
            active)
                echo "RUNNING"
                ;;
            inactive|failed)
                echo "STOPPED"
                ;;
            *)
                echo "STOPPED"
                ;;
        esac
    else
        echo "NOT FOUND"
    fi
}

echo "========== SERVICE MONITOR =========="
echo
printf "%-15s %-10s\n" "SERVICE" "STATUS"

running=0
stopped=0
not_found=0

for service in "${SERVICES[@]}"; do
    status=$(check_service "$service")

    case "$status" in
        RUNNING)
            ((running++))
            ;;
        STOPPED)
            ((stopped++))
            ;;
        "NOT FOUND")
            ((not_found++))
            ;;
    esac

    printf "%-15s %-10s\n" "$service" "$status"
done

echo
echo "Running   : $running"
echo "Stopped   : $stopped"
echo "Not found : $not_found"
echo
echo "======================================"
