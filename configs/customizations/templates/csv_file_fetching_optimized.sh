#!/bin/bash
#usage ./scriptname customer version
customer=$1
version=$2

DRLE=/mnt/samba/mounted/customers/csvfilesets/$version/$customer/

rsync -avz `ls -ltrd $DRLE/*_csv.tar.gz|awk '{print $9}' | head -n 4` /srv/customers/ver/$version/$customer/tarred


