#!/bin/bash
set -x
customer=$1
ver=$2

NETWORK_ELEMENT=$3


WORKDIR=/srv/customers/$ver/$customer/logs/cli_output/
target=/srv/customers/ver/$ver/$customer/logs/cli_output/output/r0_$IP-$(date +%Y%m%d_%H%M).txt


cd $WORKDIR
for IP in $(cat ./hosts.txt); do 
    ./r0.exp > $target
done
