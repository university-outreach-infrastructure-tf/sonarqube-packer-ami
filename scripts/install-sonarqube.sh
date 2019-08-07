#!/bin/sh

# Create sonarqube data repository
mkdir sonarqube-data

# Change the data directory permission so Docker can access it
sudo chown -R 200 sonarqube-data

# Pull SonarQube image
docker pull sonarqube
