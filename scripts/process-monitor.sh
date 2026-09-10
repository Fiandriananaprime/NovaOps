#!/bin/bash

clear

cleanup() {
    tput cnorm
    tput sgr0
    exit
}

trap cleanup INT

tput civis

echo "========== NOVAOPS PROCESS MONITOR =========="
echo
printf "%-8s %-10s %-7s %-7s %s\n" "PID" "USER" "CPU" "MEM" "COMMAND"
echo "----------------------------------------------"

while true
do
    tput cup 4 0

    ps -eo pid,user,pcpu,pmem,comm --sort=-pcpu |
    awk 'NR > 1 {
        printf "%-8s %-10s %-7s %-7s %-20s\n",
        $1, $2, $3, $4, $5
    }' |
    head -10

    tput cup 15 0
    printf "=============================================="
    
    tput cup 16 0

    sleep 1
done
