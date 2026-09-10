#!/bin/bash

while true
do
	clear

	echo "=================================="
	echo"		NOVAOPS MONITOR		"	
	echo "=================================="
	echo
	echo "1.System information"
	echo "2.Process Monitor"
	echo "3.Exit"
	read -p "Choose an option: " choice

	case $choice in
		1)
			./system-info.sh
			echo
			read -p "Press Enter to return to menu..."
			;;
		2)
			./process-monitor.sh
			;;
		3)
			echo "Exiting NovaOps..."
			exit 0
			;;
		*)
			echo "Invalid option"
			sleep 1
			;;
	esac
done
