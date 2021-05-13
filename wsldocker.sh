#!/bin/bash

# cd /mnt/d/Users/Petr/Dropbox/scripts

# Go to https://docs.docker.com/engine/install/ubuntu/ for a Ubuntu installation.
[ $# -eq 0 ] && echo"Usage: $0 <projectName>" && exit 1

# In a linux terminal:
sudo apt-get update -y && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Now, add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the repository (x86_64/amd64 based)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker Engine:
sudo apt-get update -y && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# And add your user to the Docker’s group:
sudo usermod -a -G docker $USER

# And check if docker is running:
docker -v

# You can download and install Docker-compose like this:
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# And make sure Docker-compose is executable:
sudo chmod +x /usr/local/bin/docker-compose

# You can check if Docker-compose is working:
docker-compose -v

# To install NodeJS:
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# First, I need to install PHP and Composer to initiate the Symfony project
sudo apt install php php-xml php-zip unzip

# php-xml and php-zip are required to install Symfony, unzip is recommended by Composer.

# And I can use this script to install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# I like to have Composer enable globally so I use this command
mv composer.phar /usr/local/bin/composer

# Composer is working globally

# I can make a new Laravel project, so with a linux terminal, inside the folder where you want to have your project, enter:
composer create-project laravel/laravel laravel-web && cd laravel-web && php artisan serve

# I can make a new Symfony project, so with a linux terminal, inside the folder where you want to have your project, enter:
wget https://get.symfony.com/cli/installer -O - | bash && symfony new --full symfony-web && cd symfony-web

# I can make a new Nette project, so with a linux terminal, inside the folder where you want to have your project, enter:
composer create-project nette/sandbox nette-web && cd nette-web && php -S localhost:8000 -t www

# Now I can test if my docker-compose is working
docker-compose config

# If no error, it’s time to build each container:
docker-compose up -d

# Check if my containers are up:
docker-compose ps

# Source: "https://medium.com/@fred.gauthier.dev/web-development-environment-with-wsl-2-and-docker-for-symfony-5860704e127a"
