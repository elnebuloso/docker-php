#!/usr/bin/env bash

##########################################################################################################

# select php version major.minor for installing extensions
: ${PHP_VERSION:=7.x}

##########################################################################################################

phpVersion=${PHP_VERSION%.*}
phpCommand=${1:-install}
phpExtension=${2}
phpInstaller="/opt/php/extensions/7.x/${phpExtension}"

##########################################################################################################

# check if php extension installer is available
if [[ -f "/opt/php/extensions/${phpVersion}/${phpExtension}" ]]; then
    phpInstaller="/opt/php/extensions/${phpVersion}/${phpExtension}"
fi

if [[ ! -f "${phpInstaller}" ]]; then
    exit 1
fi

##########################################################################################################

# run php extension installer
${phpInstaller} ${phpCommand}

##########################################################################################################
