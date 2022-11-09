#!/bin/bash
# wget -O - https://raw.githubusercontent.com/FHDumont/ha-config/main/install-debian.sh | bash -

echo
echo Installing Home Assistant
echo 

echo
echo Pre-reqs
echo 
sleep 5

cp /etc/network/interfaces /etc/network/interfaces.bak

apt-get install \
apparmor \
jq \
wget \
curl \
udisks2 \
libglib2.0-bin \
network-manager \
dbus \
unzip \
systemd-journal-remote -y

echo
echo Installing Docker
echo 
sleep 5

curl -fsSL get.docker.com | sh

echo
echo Installing OS Agent
echo 
sleep 5

wget https://github.com/home-assistant/os-agent/releases/download/1.4.1/os-agent_1.4.1_linux_aarch64.deb

dpkg -i os-agent_1.4.1_linux_aarch64.deb

gdbus introspect --system --dest io.hass.os --object-path /io/hass/os

echo
echo Installing Home Assistant Supervised
echo 
sleep 5

wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb

dpkg -i homeassistant-supervised.deb


echo
echo Installing HACS
echo 
sleep 5
wget -O - https://get.hacs.xyz | bash -

echo
echo Done! Reboot: reboot now
echo 
