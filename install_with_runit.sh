#!/usr/bin/env bash

sudo apt-get -y install runit

printf "Installing sense_swarm as a runit service...\n"
./sense_swarm/install.sh
sudo sv exit sense_swarm
sudo rm -rf /etc/sv/sense_swarm
sudo cp -R sense_swarm /etc/sv
sudo ln -s /etc/sv/sense_swarm /etc/service/sense_swarm
sleep 10
sudo sv up sense_swarm
