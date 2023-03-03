#!/bin/env bash

set -euo pipefail

if [ $EUID -ne 0 ]; then

        echo "Must be run as root, or with sudo"
        exit
fi

ZONE_NAME=omega.dnlab.se
ZONE_FILE=/var/cache/bind/omega.dnlab.se

if rndc status > /dev/null; then

	if named-checkconf > /dev/null; then
		
		if ! named-checkzone $ZONE_NAME $ZONE_FILE > /dev/null; then
			echo "zone file faulty"
			exit
		fi

	else echo "config file is faulty"
	exit

	fi


rndc reload

else echo "Bind is not running, giving systemctl output:
--------------------------------------------------------------------------------------------------------
$(systemctl status named)"

fi
