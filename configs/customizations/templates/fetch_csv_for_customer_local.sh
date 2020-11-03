#!/bin/bash -
set -x
#title          :/srv/customers/hotstorage/configs/customizations/customers/$customer/fetch_csv_for_$customer.sh
#description
#author         :Marian Maxim
#date           :2019-09-24
#version: 1     :4.4.20(1)-release
#
customer=$1
version=$2
DATE_OF_EXEC=$(date +'%Y-%m-%d-%H:%M:%S')
echo FETCHING STARTED AT $DATE_OF_EXEC
echo Starting the fetch

rsync -avz  /srv/customers/coldstorage/$version/$customer/tars/ /srv/customers/hotstorage/customers/$version/$customer/tarred/pm/


echo DONE for Execution time $DATE_OF_EXEC
echo "#################################################"
