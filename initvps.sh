#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
sudo update-alternatives --set python /usr/bin/python2.7

sudo apt-get install -y openssl && sudo apt-get install -y curl

sudo apt-get install -y apache2
(sudo apt-get install -y mariadb-server) || (sudo apt-get install -y mysql-server)
sudo apt-get install -y redis-server

sudo /etc/init.d/redis-server stop
sudo /etc/init.d/mysql stop
(sudo a2enmod rewrite) && (sudo /etc/init.d/apache2 stop)

sudo chmod -R 777 /var/www

sudo apt-get install -y php-common php-cli
sudo apt-get install -y php-curl php-json php-mbstring php-mysql php-xml php-zip php-bcmath php-redis

sudo curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"

sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip

sudo curl -sS https://repo.anaconda.com/miniconda/Miniconda3-3.5.2-Linux-x86_64.sh -o ~miniconda.sh
(sudo chmod u+x ./~miniconda.sh) && (sudo -E bash ./~miniconda.sh -b)
(sudo cat ./~miniconda.sh | head -n 330 | grep -nE --color=auto "echo") && (sudo rm -f ./~miniconda.sh)

sudo pip3 install numpy matplotlib pandas
sudo pip3 install sklearn

sudo apt-get install -y gcc g++ make
sudo apt-get install -y libboost-python-dev

sudo apt-get install -y default-jdk ant
(sudo apt-get install -y sqlite3) || (sudo apt-get install -y sqlite)

sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

sudo update-alternatives --set python /usr/bin/python3.5

echo *********
echo * Done! *
echo *********
