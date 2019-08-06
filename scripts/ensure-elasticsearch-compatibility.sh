#!/bin/sh

# https://hub.docker.com/_/sonarqube/
#   Because SonarQube uses an embedded Elasticsearch, make sure that the Docker host
#   configuration complies with the Elasticsearch production mode requirements and
#   File Descriptors configuration.
# https://www.elastic.co/guide/en/cloud-enterprise/current/ece-configure-hosts-rhel-centos.html
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
echo "fs.file-max=65536" | sudo tee -a /etc/sysctl.conf
sudo tee /etc/security/limits.conf <<-'EOF'
*                soft    nofile         1024000
*                hard    nofile         1024000
*                soft    memlock        unlimited
*                hard    memlock        unlimited
EOF
