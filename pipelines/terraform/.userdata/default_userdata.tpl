#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker


JENKINS_HOME=/opt/jenkins_home

# Create and set correct permissions for Jenkins mount directory
sudo mkdir -p $JENKINS_HOME
sudo chmod -R 777 $JENKINS_HOME

# Start Jenkins
docker run -id --name jenkins -p 80:8080 -p 50000:50000 -v $JENKINS_HOME:/var/jenkins_home jenkins:2.3-alpine