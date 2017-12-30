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
        docker-compose exec php72-apache php --version && echo ""v
        docker-compose ps && echo ""
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    push)
        clear

        docker tag php56-apache elnebuloso/php:5.6.32-apache
        docker tag php56-apache elnebuloso/php:5.6-apache
        docker push elnebuloso/php:5.6.32-apache
        docker push elnebuloso/php:5.6-apache
        echo ""

        docker tag php70-apache elnebuloso/php:7.0.26-apache
        docker tag php70-apache elnebuloso/php:7.0-apache
        docker push elnebuloso/php:7.0.26-apache
        docker push elnebuloso/php:7.0-apache
        echo ""

        docker tag php71-apache elnebuloso/php:7.1.12-apache
        docker tag php71-apache elnebuloso/php:7.1-apache
        docker push elnebuloso/php:7.1.12-apache
        docker push elnebuloso/php:7.1-apache
        echo ""

        docker tag php72-apache elnebuloso/php:7.2.0-apache
        docker tag php72-apache elnebuloso/php:7.2-apache
        docker push elnebuloso/php:7.2.0-apache
        docker push elnebuloso/php:7.2-apache
        echo ""
    ;;

    *)
        clear
        echo ""
        echo " - start  Start all containers"
        echo " - stop   Stop all containers"
        echo " - push   Push Images"
        echo ""
    ;;
esac