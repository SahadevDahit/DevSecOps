#!/bin/bash

# Update package lists
sudo apt update

sudo apt install -y docker.io
sudo apt update

sudo usermod -aG docker ubuntu
sudo usermod -aG docker $USER && newgrp docker

docker run -d --name sonarqube -p 9000:9000 sonarqube:lts-community
