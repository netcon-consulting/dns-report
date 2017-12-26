#!/bin/bash
## This script creates a table for SOA and MX Records for a given domainlist

domainlist=/path/to/domainlist

( printf "DOMAIN SOA EMAIL SERIAL REFRESH RETRY EXPIRE TTL PRIO MX PRIO MX\n" ; cat $domainlist | xargs -n1 -I_domain -- sh -c 'echo "_domain" $(dig +short soa _domain) $(dig +short mx _domain)' )| column -t

