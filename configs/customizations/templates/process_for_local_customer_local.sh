#!/bin/bash -
set -x
#title          :csv_processing.sh
#description
#author         :Marian Maxim
#date           :2019-09-20
#version: 1     :4.4.20(1)-release

#DATE_OF_EXEC=`date +%Y%m%d`
DATE_OF_EXEC=$3
version=$1
customer=$2
echo "removing old files"
#sleep 1800
#find /srv/customers/ver/$version/$customer/ -type f -mtime +7 -exec rm -f {} \;

#find /srv/customers/ver/$version/$customer/ -type f -name "*.csv" -mtime +5 -delete
cd /srv/customers/ver/$version/$customer/tarred/pm/$DATE_OF_EXEC/

echo "Begin of untarring"

for filetountar in `ls -l /srv/customers/ver/$version/$customer/tarred/pm/$DATE_OF_EXEC | grep -v grep | grep -v mail  |  awk '{print $9}' | egrep 'zall4am|zalp5am|znsv2am|zmrg1am|zchr1am' `; do

echo untarring $filetountar
        for CSV_FILE_NAME in `(cat /srv/configs/ver/$version/$customer/conflist.cfg)`; do
        tar -xf  $filetountar -C /srv/customers/ver/$version/$customer/untarred/ --wildcards --no-anchored "$CSV_FILE_NAME*.csv" &
        echo " untarring $CSV_FILE_NAME from $filetountar for AT&T"
        sleep 2
        done
sleep 5
done


chmod -Rf 7777 /srv/customers/ver/$version/$customer/


#echo " Untarring launched in the background, wait for it to finish"

date
echo "Finished for $DATE_OF_EXEC "
sleep 25
/srv/configs/customizations/$customer/customer-csv-rsync.sh $versuin $customer  $DATE_OF_EXEC &



