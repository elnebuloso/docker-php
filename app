#/bin/bash

case "$1" in
    start)
        echo ""
        docker-compose pull

        echo ""
        docker-compose up --build --remove-orphans -d php56-apache
        docker-compose build php56-cli

        echo ""
        docker-compose up --build --remove-orphans -d php70-apache
        docker-compose build php70-cli

        echo ""
        docker-compose up --build --remove-orphans -d php71-apache
        docker-compose build php71-cli

        echo ""
        docker-compose up --build --remove-orphans -d php72-apache
        docker-compose build php72-cli

        echo ""
        docker-compose ps
    ;;

    verify)
        echo ""
        docker-compose exec php56-apache php --version
        docker-compose run php56-cli php --version

        echo ""
        docker-compose exec php70-apache php --version
        docker-compose run php70-cli php --version

        echo ""
        docker-compose exec php71-apache php --version
        docker-compose run php71-cli php --version

        echo ""
        docker-compose exec php72-apache php --version
        docker-compose run php72-cli php --version
    ;;

    stop)
        echo ""
        docker-compose down --remove-orphans
    ;;

    *)
        echo " - start"
        echo " - stop"
        echo " - verify"
    ;;
esac