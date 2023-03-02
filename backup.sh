#!/bin/env bash

set -euo pipefail

if [ $EUID -ne 0 ]; then
        echo "Must be run as root, or with sudo"
        exit
fi

BACKUP_DIR=/home/
TARGET_DIR=/var/backups/home
NAME="backup_$(date +%F_%H_%M_%S).tar.gz"

if [ ! -d $TARGET_DIR ]; then
	echo "$TARGET_DIR doesn't exist, creating $TARGET_DIR"
	mkdir -p $TARGET_DIR
	chmod 755 $TARGET_DIR
fi

echo "Backing up $BACKUP_DIR to $TARGET_DIR/$NAME"

tar -cvzf  $TARGET_DIR/$NAME $BACKUP_DIR --same-owner


