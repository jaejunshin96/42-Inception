#!/bin/bash

# Request and Generate the private key and Certificate.
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/jaeshin.crt \
       -keyout /etc/ssl/private/jaeshin.key \
       -subj "/C=AU/ST=SA/L=Adelaide/O=42 School/OU=jaeshin/CN=jaeshin/"

mkdir -p /run/nginx

# Start the nginx daemon
nginx -g "daemon off;"
