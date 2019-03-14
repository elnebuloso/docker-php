#!/usr/bin/env bash

##########################################################################################################

# select php version major.minor for installing extensions
: ${PHP_VERSION:=7.x}

##########################################################################################################

PHPEXT_PHP_VERSION=${PHP_VERSION%.*}
PHPEXT_COMMAND=${1:-install}
PHPEXT_EXTENSION=${2}
PHPEXT_EXTENSION_INSTALLER="/opt/php/extensions/7.x/${PHPEXT_EXTENSION}"

##########################################################################################################

# check if php extension installer is available
if [[ -f "/opt/php/extensions/${PHPEXT_PHP_VERSION}/${PHPEXT_EXTENSION}" ]]; then
    PHPEXT_EXTENSION_INSTALLER="/opt/php/extensions/${PHPEXT_PHP_VERSION}/${PHPEXT_EXTENSION}"
fi

if [[ ! -f "${PHPEXT_EXTENSION_INSTALLER}" ]]; then
    exit 1
fi

##########################################################################################################

# run php extension installer
${PHPEXT_EXTENSION_INSTALLER} ${PHPEXT_COMMAND}

##########################################################################################################
