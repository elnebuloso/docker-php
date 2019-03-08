# docker-php

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/php/tags/

## php + apache

- php56-apache
- php70-apache
- php71-apache
- php72-apache
- php73-apache

### features

- enabled apache mod headers
- enabled apache mod rewrite
- enabled apache mod security
- enabled vhost config for all new php frameworks (symfony4, laravel, etc.)

## php cli

- php56-cli
- php70-cli
- php71-cli
- php72-cli
- php73-cli

## development

```
docker-compose up --build --remove-orphans -d
docker-compose down --remove-orphans
docker-compose ps
```

docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${pwd}:/app zemanlx/container-structure-test:v1.7.0-alpine test --image php56-apache --config /app/tests/structure.yaml
docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${pwd}:/app zemanlx/container-structure-test:v1.7.0-alpine test --image php56-apache --config /app/tests/structure-apache.yaml
docker run -i --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${pwd}:/app zemanlx/container-structure-test:v1.7.0-alpine test --image php56-apache --config /app/tests/structure-cli.yaml

### testing hosts

- http://php56.local.entwickl.de/
- http://php70.local.entwickl.de/
- http://php71.local.entwickl.de/
- http://php72.local.entwickl.de/
- http://php73.local.entwickl.de/
