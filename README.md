# docker-php

docker php + webserver

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/php/tags/

#### Supported tags and respective `Dockerfile` links

- [`5.6-apache` `5.6.32-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/php56-apache/Dockerfile)
- [`7.0-apache` `7.0.26-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/php70-apache/Dockerfile)
- [`7.1-apache` `7.1.12-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/php70-apache/Dockerfile)
- [`7.2-apache` `7.2.0-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/php70-apache/Dockerfile)

See full project details at https://github.com/elnebuloso/docker-php

## PHP Apache Container

### Pre-Defined VHOSTs

This Container comes with predefined vhost configurations for running modern php application like Symfony, Zend Framework, Laravel etc.
Run the following Commands in your extending Dockerfile to use the shipped VHOSTs

```
# pre-defined apache2 site
ENV APP_ENV prod
RUN container-vhost standard
```

```
# pre-defined apache2 site
ENV APP_ENV prod
RUN container-vhost symfony3
```