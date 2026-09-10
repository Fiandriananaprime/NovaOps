#!/bin/bash

echo "========== NOVAOPS SYSTEM INFO =========="
echo

echo "HOSTNAME : $(hostname)"
echo "OS       : $(uname -s)"
echo "KERNEL   : $(uname -r)"
echo "ARCH     : $(uname -m)"
echo "UPTIME   : $(uptime -p)"
echo

echo "---------- CPU ----------"
echo "CPU      : $(nproc) cores"
echo "MODEL    : $(lscpu | grep 'Model name' | cut -d ':' -f2 | xargs)"
echo

echo "---------- MEMORY ----------"
free -h
echo

echo "---------- DISK ----------"
df -h /
echo

echo "---------- NETWORK ----------"
hostname -I

echo
echo "========================================="
