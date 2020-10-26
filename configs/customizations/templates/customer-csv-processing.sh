#!/bin/bash -  
set -x
#title          :csv_processing.sh
#description            
#author         :Marian Maxim
#date           :2019-09-20
#version: 1     :4.4.20(1)-release
version=$1 
customer=$2
filetountar=$(ls -lrtd /srv/customers/ver/$version/$customer/tarred/* | grep -v grep | grep -v mail | tail -1 | awk '{print $9}')
cd /srv/customers/ver/$version/$customer/
tar  -xvf $filetountar
chmod -Rf 7777 /srv/customers/ver/$1/
rsync -a /srv/customers/ver/$version/$customer/pm/ /srv/customers/ver/$version/$customer/csvfolders
