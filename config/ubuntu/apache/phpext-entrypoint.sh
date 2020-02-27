#!/usr/bin/env bash
set -e

##########################################################################################################

: ${PHPEXT_ENABLE_XDEBUG:=no}

if [[ ${PHPEXT_ENABLE_XDEBUG} = "yes" && $(php -m | grep xdebug) = "" ]]; then
    phpenmod xdebug
fi

##########################################################################################################

# first arg is `-f` or `--some-option`
if [[ "${1#-}" != "$1" ]]; then
	set -- apache-foreground "$@"
fi

exec "$@"
