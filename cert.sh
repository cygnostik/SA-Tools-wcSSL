#!/bin/sh
echo "You'll need to be ready to add a DNS record to continue..."
echo "\n"
echo "Run with cert.sh email@addie.com SSL-Domain.FQDN or *.domain.com"
read -p "Press CRTL+C to abord, [Enter] to continue."
certbot certonly --manual --preferred-challenges=dns --email $1 --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d $2
