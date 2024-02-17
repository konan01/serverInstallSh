#!/bin/bash
systemctlFunc() {
wget -o - https://raw.githubusercontent.com/konan01/serverInstallSh/master/homeassistant.service
mv homeassistant.service /etc/systemd/system/
sudo systemctl enable homeassistant.service
sudo service homeassistant start

}

venvFunc() {
python3.10 -m venv venv
source venv/bin/activate
python3.10 -m pip install --upgrade pip
python3.10 -m pip install wheel
python3.10 -m pip install homeassistant
systemctlFunc

}

cd ~
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update
sudo apt-get install -y python3.10
apt-get install -y python3.10-dev python3.10-venv bluez libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0-dev tzdata ffmpeg liblapack3 liblapack-dev libatlas-base-dev
useradd -rm homeassistant
mkdir /home/homeassistant/HA
chown -R homeassistant:homeassistant /home/homeassistant/*
cd /home/homeassistant/HA
venvFunc
