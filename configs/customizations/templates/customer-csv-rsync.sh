#!/bin/bash -
set -x
#title          :csv_rsync.sh
#description
#author         :Marian Maxim
#date           :2020-11-13
#version: 1     :4.4.20(1)-release
#DATE_OF_EXEC=`date +%Y%m%d`
DATE_OF_EXEC=$3
version=$1
customer=$2
sleep 30

cd /srv/customers/ver/$version/$customer/tarred/pm/$DATE_OF_EXEC/

find /srv/customers/ver/9-4/att/csvfolders/z*/ -type f -name "*.csv" -mtime +7 -exec rm -f {} \;
find /srv/customers/ver/9-4/att/untarred/z*/ -type f -name "*.csv" -mtime +7 -exec rm -f {} \;


echo "Begin of rsync"
#sleep 120

for foldertorsync in `ls -lrt /srv/customers/ver/$version/$customer/untarred | grep -v grep | grep -v "total" |grep -v mail |  awk '{print $9}'`; do
        echo " Rsync Started for $foldertorsync "
        mkdir -p /srv/customers/ver/9-4/att/csvfolders/$foldertorsync/ && chmod -Rf 777 /srv/customers/ver/9-4/att/csvfolders/$foldertorsync
                for CSV_FILE_NAME in `(cat /srv/configs/ver/$version/$customer/conflist.cfg)`; do
                rsync -a --inplace /srv/customers/ver/$version/$customer/untarred/$foldertorsync/$CSV_FILE_NAME* /srv/customers/ver/$version/$customer/csvfolders/$foldertorsync/ &
                echo "rsync executed for $CSV_FILE_NAME in background"
                done
        echo "Finished Rsync for $foldertorsync "
sleep 5
done


chmod -Rf 7777 /srv/customers/ver/$version/$customer/
sleep 2

echo " Rsync  launched in the background, wait for it to finish"
date
echo "Finished for $DATE_OF_EXEC "

