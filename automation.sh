#!/bin/bash
myname="Prakash"
s3_bucket="upgrad-prakashkumar"

#Installing apache webserver
sudo apt update -y
sudo apt install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

#Creating tar in tmp folder
sudo tar -cvf /tmp/Prakash-httpd-logs-$(date '+%d%m%Y-%H%M%S').log /var/log/apache2

#Copying files to s3 bucket
sudo aws s3 cp /tmp/${myname}-httpd-logs-*.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
