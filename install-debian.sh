#!/bin/bash
# wget -O - https://raw.githubusercontent.com/FHDumont/ha-config/main/install-debian.sh | bash -

echo
echo Installing Home Assistant
echo 

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
systemd-journal-remote -y

curl -fsSL get.docker.com | sh

wget https://github.com/home-assistant/os-agent/releases/download/1.4.1/os-agent_1.4.1_linux_arm64.tar.gz

dpkg -i os-agent_1.4.1_linux_arm64.tar.gz

gdbus introspect --system --dest io.hass.os --object-path /io/hass/os

sleep 5

wget https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb

dpkg -i homeassistant-supervised.deb

wget -O - https://get.hacs.xyz | bash -

echo
echo Done! Reboot: reboot now
echo 
