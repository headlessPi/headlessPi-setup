#!/bin bash

SETUP_LOC=/usr/local/headlessPi/setup

apt-get update
apt-get install -y git ansible
mkdir -p $SETUP_LOC
echo -e "[headlessPi]\nraspberrypi ansible_connection=local" > /tmp/ansible-hosts
ansible-pull -o -C master -d $SETUP_LOC -i /tmp/ansible-hosts -U https://github.com/headlessPi/headlessPi-setup.git
rm /tmp/ansible-hosts
apt-get clean