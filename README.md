
7.4-debian-apache
7.4-apache-debian
7.4-apache-debian-buster

7.4-apache-ubuntu
7.4-apache-ubuntu-bionic



# docker-php

[![Docker Pulls](https://img.shields.io/docker/pulls/elnebuloso/php.svg)](https://hub.docker.com/r/elnebuloso/php)
[![GitHub](https://img.shields.io/github/license/elnebuloso/docker-php.svg)](https://github.com/elnebuloso/docker-php)

Dockerized PHP 7.x

## tags

- see Supported Tags at https://hub.docker.com/r/elnebuloso/php/tags/
- based on https://hub.docker.com/_/php

## official

- from on https://hub.docker.com/_/php
- 7.3-apache
- 7.3-cli
- 7.2-apache
- 7.2-cli
- 7.1-apache
- 7.1-cli

### features

- default enabled apache mod headers
- default enabled apache mod rewrite
- default enabled vhost config for all new php frameworks (symfony4, laravel, etc.)
- default disabled remote ip in access and error logs

#### xdebug

- installed but disabled, can be enabled by environment variable PHPEXT_ENABLE_XDEBUG=yes

## ubuntu

- from ubuntu:18.04
- 7.3-apache-ubuntu
- 7.3-cli-ubuntu
- 7.2-apache-ubuntu
- 7.2-cli-ubuntu
- 7.1-apache-ubuntu
- 7.1-cli-ubuntu

### features

- default enabled apache mod headers
- default enabled apache mod rewrite
- default enabled vhost config for all new php frameworks (symfony4, laravel, etc.)
- default disabled remote ip in access and error logs

#### xdebug

- installed but disabled, can be enabled by environment variable PHPEXT_ENABLE_XDEBUG=yes