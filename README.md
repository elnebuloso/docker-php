# docker-php

docker php + webserver

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/php/tags/

#### Supported tags and respective `Dockerfile` links

- [`5.6-apache` `5.6.x-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/apache/Dockerfile)
- [`7.0-apache` `7.0.x-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/apache/Dockerfile)
- [`7.1-apache` `7.1.x-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/apache/Dockerfile)
- [`7.2-apache` `7.2.x-apache` (Dockerfile)](https://github.com/elnebuloso/docker-php/blob/master/apache/Dockerfile)

See full project details at https://github.com/elnebuloso/docker-php

## php apache container

- enabled apache mod headers
- enabled apache mod rewrite
- enabled apache mod security

### predefined vhosts

This Container comes with predefined vhost configurations for running modern php application like Symfony, Zend Framework, Laravel etc.
Run the following Commands in your extending Dockerfile to use the shipped vhost files

```
# predefined apache2 site
ENV APP_ENV prod
RUN container-vhost standard
```

```
# predefined apache2 site
ENV APP_ENV prod
RUN container-vhost symfony3
```

### environments

#### APP_ENV

This Variable defines settings in the delivered vhost configurations

##### dev

- pre-defined environment settings for development
- displaying errors etc.

##### prod

- pre-defined environment settings for production
- disabled displaying of errors etc.