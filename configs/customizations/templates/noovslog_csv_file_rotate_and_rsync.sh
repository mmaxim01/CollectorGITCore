#!/bin/bash
set -x
#usage ./scriptname customer version
customer=$1
version=$2
chmod -Rf 7777 /srv/customers/hotstorage/customers/$version/$customer/*
rsync -a /srv/customers/hotstorage/customers/$version/$customer/tarred/*_csv.tar.gz /srv/customers/hotstorage/customers/$version/$customer/archive/
find /srv/customers/hotstorage/customers/$version/$customer/ -type f -mtime +2 -exec rm -f {} \;
rsync -a /srv/customers/hotstorge/customers/$version/$customer/pm/ /srv/customers/hotstorage/customers/$version/$customers/csvfolders

