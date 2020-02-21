#!/bin/sh
echo "Run with your email address and domain name as options."
echo "example: ./wildcard.sh you@company.com company.com"
echo "\n"
echo "If you cannot create a TXT record in your zone NOW press CTRL-C to abort"
read -s -r -p "You are $1 and generating wildcard SSL for $2? (press any key or CTRL-C to abort)"
clear
certbot certonly --manual --preferred-challenges=dns --email $1 --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.$2
echo "\n"
echo "The certbot script has now run, hopefully you're all set with details on your SSL files above."
echo "They are already located in /etc/letsencrypt/live/$2/"
echo "\n"
read -p "Press [Enter] for ESXi use or CTRL-C to exit."
clear
echo "Copying your new wildcard SSL files to: $2-`date +r'%Fr'`"
mkdir $2-`date +"%F"`
cp /etc/letsencrypt/live/$2/fullchain.pem ./$2-`date +'%F'`/castore.pem
cp /etc/letsencrypt/live/$2/cert.pem ./$2-`date +'%F'`/rui.crt
cp /etc/letsencrypt/live/$2/privkey.pem ./$2-`date +'%F'`/rui.key
echo "done"
echo "\n"
echo "The files now in ./$2-`date +'F'`, listed below"
echo "should be place in /etc/vmware/ssl/ on the ESXi Host."
ls -h ./$2-`date +'%F'`/
echo "----------------------------------------------------------------------"
echo "\n"
echo "NOTE: If certs fail on ESXI host, run /sbin/generate-certificates and services.sh restart."
