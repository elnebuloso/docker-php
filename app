#/bin/bash

case "$1" in
    start)
        echo ""
        docker-compose pull

        echo ""
        docker-compose up --build --remove-orphans -d php56-apache

        echo ""
        docker-compose up --build --remove-orphans -d php70-apache

        echo ""
        docker-compose up --build --remove-orphans -d php71-apache

        echo ""
        docker-compose up --build --remove-orphans -d php72-apache

        echo ""
        docker-compose ps
    ;;

    verify)
        echo ""
        docker-compose exec php56-apache php --version

        echo ""
        docker-compose exec php70-apache php --version

        echo ""
        docker-compose exec php71-apache php --version

        echo ""
        docker-compose exec php72-apache php --version
    ;;

    stop)
        echo ""
        docker-compose down --remove-orphans
    ;;

    *)
        echo ""
        echo ""
        echo " - start   start all containers"
        echo " - stop    stop all containers"
        echo " - verify  verify all containers"
        echo ""
        echo ""
    ;;
esac