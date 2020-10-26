#!/bin/bash
set -x
#usage ./scriptname customer version
customer=$1
version=$2
chmod -Rf 7777 /srv/customers/ver/$version/$customer/*
rsync -a /srv/customers/ver/$version/$customer/tarred/*_csv.tar.gz /srv/customers/ver/$version/$customer/archive/
find /srv/customers/ver/$version/$customer/ -type f -mtime +2 -exec rm -f {} \;
rsync -a /srv/customers/ver/$version/$customer/pm/ /srv/customers/ver/$version/$customers/csvfolders

