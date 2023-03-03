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
		
		if ! named-checkzone $ZONE_NAME $ZONE_FILE | grep -q "OK"; then
			echo "Zone file faulty:"
				named-checkzone $ZONE_NAME $ZONE_FILE
			exit
		fi

	else echo "Config file is faulty:"
		named-checkconf
	exit

	fi


rndc reload

else echo "Bind is not running, giving systemctl output:
----------------------------------------------------------------------------------------------------
$(systemctl status named)"

fi
