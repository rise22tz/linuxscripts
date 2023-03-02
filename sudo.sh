#!/bin/env bash

set -euo pipefail

if [ $EUID -ne 0 ]; then
	echo "not root"
else
	echo "is root"
fi
