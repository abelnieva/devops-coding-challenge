#!/bin/bash
sudo apt-get update
sudo apt-get -y install python-pip
sudo pip install --upgrade pip
git clone git@github.com:abelnieva/devops-coding-challenge.git
pip install -r ./scripts/app/requirements.txt
python ./scripts/app/init.py