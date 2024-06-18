#! /bin/bash
sudo yum update -y --allowerasing
sudo yum upgrade -y --allowerasing
sudo yum install -y --allowerasing yum-utils

sudo rm /root/.ssh/authorized_keys
sudo cp /home/opc/.ssh/authorized_keys /root/.ssh/authorized_keys
sudo systemctl start firewalld
sudo firewall-cmd --zone=public --add-port=0-65535/tcp --permanent
sudo firewall-cmd --zone=public --add-port=0-65535/udp --permanent
sudo firewall-cmd --reload
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y --allowerasing docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
