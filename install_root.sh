#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/stf_buildout/etc/nginx.conf ./sites-available/stf.conf
cd sites-enabled
ln -s ../sites-available/stf.conf

service nginx stop
certbot certonly --standalone -d stf.voteit.se
service nginx start
