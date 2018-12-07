#/bin/bash

case "$1" in
    build)
        docker build --pull --rm --tag docker-php-apache-$2 --build-arg PHP_VERSION=$2 --file Dockerfile.apache .
        docker build --pull --rm --tag docker-php-cli-$2 --build-arg PHP_VERSION=$2 --file Dockerfile.cli .

        docker run --detach --name=docker-php-apache-$2 --publish 80 --volume $(pwd)/www:/var/www docker-php-apache-$2
        docker port docker-php-apache-$2

        echo " ---> apache"
        docker run docker-php-apache-$2 php --version

        echo ""
        echo " ---> cli"
        docker run docker-php-cli-$2 php --version
    ;;

    stop)
        docker ps --format '{{.Names}}' | grep "^docker-php-" | awk '{print $1}' | xargs -I {} docker stop {}
    ;;

    *)
        echo " - build"
        echo " - stop"
    ;;
esac