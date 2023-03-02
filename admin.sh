#!/bin/env bash

set -euo pipefail

if [ $EUID -ne 0 ]; then
	
	echo "Must be run as root, or with sudo"
	exit
fi

read -p "Username for new admin: " user

while grep -q $user /etc/passwd; do
	read -p "User already exists, enter another username:" user

	if [ -z $user ]; then
		echo "No input, quitting.."
		exit
	fi
done

echo "Creating user and adding to wheel"
useradd -m -s /bin/bash $user
usermod -aG wheel $user
