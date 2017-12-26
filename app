#/bin/bash

case "$1" in
    start)
        sh ./app start.php56
        sh ./app start.php70
        sh ./app start.php71
        sh ./app start.php72
    ;;

    start.php56)
        docker-compose pull
        docker-compose up --build --remove-orphans -d php56-apache
        docker-compose ps
    ;;

    start.php70)
        docker-compose pull
        docker-compose up --build --remove-orphans -d php70-apache
        docker-compose ps
    ;;

    start.php71)
        docker-compose pull
        docker-compose up --build --remove-orphans -d php71-apache
        docker-compose ps
    ;;

    start.php72)
        docker-compose pull
        docker-compose up --build --remove-orphans -d php72-apache
        docker-compose ps
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    ps)
        docker-compose ps
    ;;

    logs)
        docker-compose logs --follow
    ;;

    *)
        clear
        echo ""
        echo " Commands"
        echo ""
        echo " - start           Start all containers"
        echo " - start.php55     Start PHP 5.5 containers"
        echo " - start.php70     Start PHP 7.0 containers"
        echo " - start.php71     Start PHP 7.1 containers"
        echo " - start.php72     Start PHP 7.2 containers"
        echo " - stop            Stop all containers"
        echo " - ps              List containers"
        echo " - logs            View output from containers"
        echo ""
    ;;
esac