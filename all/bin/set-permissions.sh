#!/usr/bin/env bash
set -e

##########################################################################################################

echo "- set-permissions $1"

if [[ -f "$1" ]]; then
    chmod $2 $1
    chown $3 $1

    echo "- set-permissions done: $1"
fi

if [[ -d "$1" ]]; then
    chmod $2 -R $1
    chown $3 -R $1

    echo "- set-permissions done: $1"
fi

##########################################################################################################