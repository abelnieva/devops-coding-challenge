#!/bin/bash
sudo apt-get update
sudo apt-get -y install python-pip  python-dev nginx

sudo pip install --upgrade pip
pip install uwsgi flask
git clone https://github.com/abelnieva/devops-coding-challenge.git
pip install -r /devops-coding-challenge/script/app/requirements.txt
#nohup python /devops-coding-challenge/script/app/init.py&
cd  /devops-coding-challenge/script/app/
nohup uwsgi --ini /devops-coding-challenge/script/app/wsgi.ini --socket 0.0.0.0:5000 --protocol=http -w wsgi & 
sudo cp /devops-coding-challenge/script/app/nginx_config /etc/nginx/sites-available/myproject
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-available/default
sudo service nginx restart

