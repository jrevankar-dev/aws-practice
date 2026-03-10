#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras enable corretto17
sudo yum install java-17-amazon-corretto -y

java -version

sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install jenkins -y

sudo systemctl start jenkins

sudo systemctl enable jenkins
sudo systemctl status jenkins

