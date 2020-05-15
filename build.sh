#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./build [option]"
    echo " -h for help"
    echo " -f to fore rebuild containers"
    exit 0
fi

if [ ! -f "./.env" ]; then
    cp ./.env.dist ./.env
fi

if [ ! -f "./apps/cardmaker/README.md" ]; then
    git clone git@github.com:michalporembski/cardmaker.git ./apps/cardmaker
fi

if [ ! -f "./apps/cardmaker/composer.phar" ]; then
    curl -o ./apps/cardmaker/composer.phar https://getcomposer.org/composer-stable.phar
fi

if [ ! -f "./apps/cardmaker/.env" ]; then
    cp ./apps/cardmaker/.env.dist ./apps/cardmaker/.env
fi

if [ "$1" == "-f" ]; then
    docker-compose down
    docker-compose build --no-cache
fi

docker-compose up -d

docker exec -u 0 -it cardmaker_php chmod 777 -R /.composer
docker exec -it cardmaker_php php -d memory_limit=-1 composer.phar install
