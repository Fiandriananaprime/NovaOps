# NovaOps

Linux and DevOps toolkit for **Nova Market**, designed as a practical learning project for server administration, Bash automation, monitoring, backups, Docker, and deployment.

The goal of NovaOps is to learn Linux and DevOps by building tools that could be useful for a real multi-vendor e-commerce application instead of practicing isolated commands with no context.

## Project Goals

NovaOps will progressively provide scripts and infrastructure for:

- Server information and system inspection
- Process monitoring
- Log analysis
- Database/application backups
- Backup restoration
- Application health checks
- Linux service management with systemd
- Nginx reverse proxy configuration
- Docker containerization
- Deployment automation
- CI/CD foundations

## Current Features

The current version of NovaOps includes:

- System information monitoring
- Process monitoring
- Linux service monitoring
- Disk usage monitoring
- Log analysis
- Backup creation and retention
- System alert detection
- Centralized CLI
- Cron-based alert automation

### NovaOps CLI

NovaOps provides a centralized command-line interface:

```bash
./novaops.sh help

## Project Structure

```text
.
├── backups
│   ├── novaops_backup_2026-09-10_13-24-08.tar.gz
│   ├── novaops_backup_2026-09-10_13-27-04.tar.gz
│   ├── novaops_backup_2026-09-10_14-30-24.tar.gz
│   ├── novaops_backup_2026-09-10_14-51-10.tar.gz
│   └── novaops_backup_2026-09-10_14-57-53.tar.gz
├── config
├── docker
│   ├── backend.Dockerfile
│   ├── docker-compose.yml
│   └── frontend.Dockerfile
├── logs
│   ├── access.log
│   ├── alerts.log
│   ├── app.log
│   └── error.log
├── novaops.sh
├── README.md
└── scripts
    ├── alert-system.sh
    ├── backup-manager.sh
    ├── cron-automation.sh
    ├── disk-monitor.sh
    ├── log-analyzer.sh
    ├── monitoring
    │   ├── monitor.sh
    │   ├── process-monitor.sh
    │   └── system-info.sh
    └── service-monitor.sh

## Architecture

```text
                         Internet
                            |
                            v
                         Nginx
                       /       \
                      v         v
                 Frontend     Backend
                                |
                                v
                           PostgreSQL
                                |
                                v
                             Backups


                         NovaOps
                            |
          +-----------------+-----------------+
          |                 |                 |
          v                 v                 v
       System           Monitoring         Backup
          |                 |                 |
          ├── Server info   ├── Health check  ├── Backup
          ├── Processes     └── Log analysis  └── Restore
          └── Cleanup
                            |
                            v
                     Infrastructure
                            |
                   +--------+--------+
                   |        |        |
                   v        v        v
                systemd   Nginx    Docker

NovaOps provides the operational layer around the Nova Market application

