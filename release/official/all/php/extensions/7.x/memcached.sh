#!/usr/bin/env bash

##########################################################################################################

COMMAND=${1:-install}

##########################################################################################################

if [[ ${COMMAND} = "install" ]]; then
    pecl install memcached-3.1.3
fi

##########################################################################################################