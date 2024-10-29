#!/bin/sh

sudo apt-get update -yy

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

docker run -d -p 6379:6379 --name redis redis