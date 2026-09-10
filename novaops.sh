#!/bin/bash

version="1.0.0"
show_help() {
    echo "NovaOps - Linux system management toolkit"
    echo
    echo "Usage:"
    echo "  $0 <command>"
    echo
    echo "Commands:"
    echo "  system              Monitor system"
    echo "  processes           Monitor processes"
    echo "  services            Monitor services"
    echo "  disk                Monitor disk usage"
    echo "  logs <file>         Analyze log file"
    echo "  backup              Create a backup"
    echo "  alerts              Check system alerts"
    echo "  help                Show this help message"
    echo "  --version           Show version"
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"

if [ $# -eq 0 ]; then
	show_help
	exit 0
fi

case "$1" in
	system)
		"$SCRIPTS_DIR/monitoring/monitor.sh"
		;;

	processes)
		"$SCRIPTS_DIR/monitoring/process-monitor.sh"
		;;
	
	services)
		"$SCRIPTS_DIR/service-monitor.sh"
		;;

	disk)
		"$SCRIPTS_DIR/disk-monitor.sh"
		;;

	logs)
		shift
		"$SCRIPTS_DIR/log-analyzer.sh" "$@"
		;;

	backup)
		"$SCRIPTS_DIR/backup-manager.sh"
		;;

	alerts)
		"$SCRIPTS_DIR/alert-system.sh"
		;;

	help|-h|--help)
		show_help
		;;

	--version|-v)
		echo "NovaOps version $version"
		;;

	*)
		echo "Unknown command: $1"
		echo
		echo
		show_help
		exit 1
		;;
esac

