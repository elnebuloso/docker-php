#/bin/bash

case "$1" in
    start)
        docker-compose pull
        docker-compose up --build --remove-orphans -d php56-apache
        docker-compose up --build --remove-orphans -d php70-apache
        docker-compose up --build --remove-orphans -d php71-apache
        docker-compose up --build --remove-orphans -d php72-apache

        clear
        docker-compose exec php56-apache php --version && echo ""
        docker-compose exec php70-apache php --version && echo ""
        docker-compose exec php71-apache php --version && echo ""
        docker-compose exec php72-apache php --version && echo ""
        docker-compose ps
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    *)
        clear
        echo ""
        echo " - start  Start all containers"
        echo ""
    ;;
esac