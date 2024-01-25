#!/bin/bash

# Declare the variable that stores the location of the created private key
private_key="/etc/nginx/ssl/jaeshin.key"

# Declare the variable that stores the location of the created CSR
certificate_signing_request="/etc/nginx/ssl/jaeshin.crt"

# Declare the options
options="/C=AU/ST=SA/L=Adelaide/O=42 School/OU=jaeshin/CN=jaeshin/"

# Request and Generate the private key and Certificate.
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/jaeshin.crt \
       -keyout /etc/nginx/ssl/jaeshin.key \
       -subj "/C=AU/ST=SA/L=Adelaide/O=42 School/OU=jaeshin/CN=jaeshin/"

# Start the nginx daemon
nginx -g "daemon off;"