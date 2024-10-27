#!/bin/sh

sudo apt-get update -yy
sudo apt-get install -yy git curl

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

wget https://raw.githubusercontent.com/iAbdullah80/capstone-project/refs/heads/deployment/compose.yml
printf "REDIS_HOST=${redis_host}\nDB_HOST=${db_host}\nDB_USER=user\nDB_PASSWORD=password\nDB_NAME=mydatabase\n" >> .env
docker compose up web -d