#!/usr/bin/env bash

##########################################################################################################

COMMAND=${1:-install}

##########################################################################################################

if [[ ${COMMAND} = "install" ]]; then
    docker-php-ext-install opcache
fi

##########################################################################################################
