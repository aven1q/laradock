#!/bin/bash

current=/var/www/html/current

release=$(readlink $current)
releaseName=$(echo $release | sed -e 's/.*\///g')
projectName="limsdock_$releaseName"

#docker-compose -p $projectName -f qa-docker-compose.yml exec certbot certbot renew --dry-run

docker-compose -p $projectName -f qa-docker-compose.yml exec certbot bash /root/certbot/run-certbot.sh && sleep infinity

docker-compose -p $projectName -f qa-docker-compose.yml exec nginx nginx -s reload
