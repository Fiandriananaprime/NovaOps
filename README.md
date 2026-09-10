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

## Project Structure

```text
novaops/
├── README.md
├── scripts/
│   ├── server-info.sh
│   ├── monitor.sh
│   ├── log-analyzer.sh
│   ├── backup.sh
│   ├── restore.sh
│   ├── healthcheck.sh
│   ├── deploy.sh
│   └── cleanup.sh
├── logs/
│   ├── access.log
│   ├── error.log
│   └── app.log
├── backups/
├── config/
└── docker/
    ├── frontend.Dockerfile
    ├── backend.Dockerfile
    └── docker-compose.yml

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

