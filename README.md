# docker-php

docker php + webserver

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/php/tags/

## php apache container

- enabled apache mod headers
- enabled apache mod rewrite
- enabled apache mod security

### predefined vhosts

This Container comes with predefined vhost configurations for running modern php application like Symfony, Zend Framework, Laravel etc.
Run the following Commands in your extending Dockerfile to use the shipped vhost files

```
# predefined apache2 site
RUN container-vhost standard
```

```
# predefined apache2 site
RUN container-vhost symfony3
```

### environments

- set this in your dockerfile

#### APP_ENV

This Variable defines settings in the delivered vhost configurations

##### dev

- pre-defined environment settings for development
- displaying errors etc.

##### prod

- pre-defined environment settings for production
- disabled displaying of errors etc.