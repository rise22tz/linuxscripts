#!/usr/bin/env bash

set -euo pipefail

MEMORY=$(free -h)
STORAGE=$(df -h)
UPTIME=$(uptime -p)
HOSTNAME=$(hostname)
BACKUP_SIZE=$(du -sh /var/backups)
SSHD_STATUS=$(systemctl status sshd | grep Active:)

echo "Host $HOSTNAME has been $UPTIME
-----------------------------------------------------------------------
MEMORY USAGE:
$MEMORY
-----------------------------------------------------------------------
STORAGE USAGE:
$STORAGE
-----------------------------------------------------------------------
BACKUPS SIZE:
$BACKUP_SIZE
-----------------------------------------------------------------------
SSH STATUS:
$SSHD_STATUS
-----------------------------------------------------------------------"
