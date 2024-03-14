#!/bin/bash
sudo yum update -y
sudo yum install httpd docker -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run -d --name nginx1 -p 8080:80 nginx
sudo docker run -d --name nginx2 -p 8081:80 nginx
