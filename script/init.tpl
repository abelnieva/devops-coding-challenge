#!/bin/bash
sudo apt-get update
sudo apt-get -y install python-pip
sudo pip install --upgrade pip
git clone https://github.com/abelnieva/devops-coding-challenge.git
pip install -r /devops-coding-challenge/script/app/requirements.txt
nohup python /devops-coding-challenge/script/app/init.py&