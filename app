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

    create)
        docker build --pull -t php56-apache-latest -f php56-apache/Dockerfile .
        docker build --pull -t php70-apache-latest -f php70-apache/Dockerfile .
        docker build --pull -t php71-apache-latest -f php71-apache/Dockerfile .
        docker build --pull -t php72-apache-latest -f php72-apache/Dockerfile .

        clear

        echo "php56-apache"
        docker run php56-apache php --version && echo ""

        echo "php70-apache"
        docker run php70-apache php --version && echo ""

        echo "php71-apache"
        docker run php71-apache php --version && echo ""

        echo "php72-apache"
        docker run php72-apache php --version && echo ""
    ;;

    *)
        clear
        echo ""
        echo " - start   Start all containers"
        echo " - stop    Stop all containers"
        echo " - create  Create Images"
        echo ""
    ;;
esac