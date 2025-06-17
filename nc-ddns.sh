#!/bin/bash
#Example Case - host in.ter.com
#HOST=in
#DOMAIN=ter.com
#PASSWORD=1234567890abcdef1234567890abcdef

HOSTS=$HOST # can be comma-separated. Ex: "@,*" would cover base domain and all subdomains.
DOMAIN=$DOMAIN
PASSWORD=$NAMECHEAP_DDNS_PASSWORD

IFS=',' read -ra array <<< "$HOSTS"

for HOST in "${array[@]}"; do
	echo $HOST
	dns_ip=$(dig $host.$domain +short) #check the registered ip in dns
	if [ $HOST == "@" ]; then
		dns_ip=$(dig $domain +short) #check the registered ip in dns
	fi
	public_ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com|awk -F'"' '{print $2}') #Check Public IP



	if [ "$public_ip" != "$dns_ip" ]
	then
		curl "https://dynamicdns.park-your-domain.com/update?host=$HOST&domain=$DOMAIN&password=$PASSWORD&ip=$public_ip"
		echo "Updated $HOST.$DOMAIN from $dns_ip to $public_ip"
	fi
done


