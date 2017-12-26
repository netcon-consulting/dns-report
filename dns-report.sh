#!/bin/bash
## This script creates a table for SOA and MX Records for a given domainlist

domainlist=domainlist.txt

( printf "DOMAIN SOA EMAIL SERIAL REFRESH RETRY EXPIRE TTL PRIO MX PRIO MX\n" ; xargs -n1 -I_domain -- sh -c 'echo "_domain" $(dig +short soa _domain) $(dig +short mx _domain)' < "$domainlist") | column -t

