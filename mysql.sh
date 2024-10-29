#!/bin/sh

sudo apt-get update -yy

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

wget https://raw.githubusercontent.com/iAbdullah80/capstone-project/refs/heads/deployment/compose.yml
touch .env

docker compose up db -d