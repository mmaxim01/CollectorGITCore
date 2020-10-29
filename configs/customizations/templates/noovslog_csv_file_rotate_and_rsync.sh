#!/bin/bash
set -x
#usage ./scriptname customer version
customer=$1
version=$2
chmod -Rf 7777 /srv/customers/hotstorage/$version/$customer/*
rsync -a /srv/customers/hotstorage/$version/$customer/tarred/*_csv.tar.gz /srv/customers/hotstorage/$version/$customer/archive/
find /srv/customers/hotstorage/$version/$customer/ -type f -mtime +2 -exec rm -f {} \;
rsync -a /srv/customers/hotstorge/$version/$customer/pm/ /srv/customers/hotstorage/$version/$customers/csvfolders

