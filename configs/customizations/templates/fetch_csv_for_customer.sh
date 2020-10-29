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
LOCAL_PORT=$3
NETWORK_ELEMENT_LIST=/srv/customers/hotstorage/configs/customizations/customers/$customer/
DATE_OF_EXEC=$(date +'%Y-%m-%d-%H:%M:%S')
echo FETCHING STARTED AT $DATE_OF_EXEC
echo Starting the fetch
for NETWORK_ELEMETN_NAME in `cat $NETWORK_ELEMENT_LIST`; do

rsync -avz -e "ssh -p $LOCAL_PORT " affirmed@localhost:/opt/Affirmed/NMS/server/ems/data/pm/$NETWORK_ELEMETN_NAME/ /srv/customers/hotstorage/customers/$version/$customer/pm/$NETWORK_ELEMETN_NAME/
echo Fetch for $NETWORK_ELEMETN_NAME finished

done 

echo DONE for Execution time $DATE_OF_EXEC
echo "#################################################"



                        
                        



