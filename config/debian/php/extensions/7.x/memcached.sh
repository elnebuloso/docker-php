#!/usr/bin/env bash
set -e

##########################################################################################################

COMMAND=${1:-install}

##########################################################################################################

if [[ ${COMMAND} = "install" ]]; then
    pecl install memcached
fi

##########################################################################################################