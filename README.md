# docker-php

## docker hub

- see Supported Tags at https://hub.docker.com/r/elnebuloso/php/tags/
- based on https://hub.docker.com/_/php

### features with apache

- default enabled apache mod headers
- default enabled apache mod rewrite
- default enabled apache mod security
- default enabled vhost config for all new php frameworks (symfony4, laravel, etc.)
- json logging format for access and error logs
- default disabled remote ip in access and error logs

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
