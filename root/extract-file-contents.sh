#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo "no argument provided"
	exit 1
fi

cut -f 3,4,5,6,7,8,9,10 -d " " "$1" | sed "s/ //g" | tr -d '\n' | xxd -r -p > dump.rom
