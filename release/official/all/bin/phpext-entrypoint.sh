#!/usr/bin/env bash
set -e

##########################################################################################################

: ${PHPEXT_ENABLE_XDEBUG:=no}

if [[ ${PHPEXT_ENABLE_XDEBUG} = "yes" && $(php -m | grep xdebug) = "" ]]; then
    phpext enable xdebug
fi

##########################################################################################################

# run the original entrypoint located
exec docker-php-entrypoint "$@"

##########################################################################################################
