# SA-Tools-wcSSL
 System admins tools, Starting with a wildcard SSL setup
-----------------------------------------------------------

wildcard.sh was meant to follow up on the outline here: https://chrismish.com/technical/esxi-host-ssl
...to automate part of a larger process. I figured it would come in handy for other uses too and that maybe others could find use for, or want to improve it.

**Update**: These fully valid, plain ol' wild card SSL certificates are verified working ESXi 6.5 and 6.7 both.

Feel free to Discord me for anything but support. I just don't have the time: Cygnostik#1337

Other little time savers added so far:
cert.sh <youremail> <server.hostname.tld>

#####
## This one is an odd 'hack' because Ubuntu Cockpit certbot support is lacking.
## Toss the file "certbot" into your /etc/cron.weekly/certbot
## it will check SSL status and renew if needed soon.
## Then combine the cert & private key into your Cockpit ssl directory.
## If any issues, check that the 0-* snakeoil cert is removed pre-reload.

--- More soon! ---

***NOTES***
This was written on and for use on an Ubuntu 18.04LTS linux server. One which will be kept on the bleeding edge and updates to this script will reflect that.
