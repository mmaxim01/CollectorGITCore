#!/bin/bash
set -x 

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo 'one or more variables are undefined'        
  echo " usage ./scriptname customer version NE_TYPE "
 exit 1
fi


echo " remember to edit /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NE_TYPE/conflist.cfg before execution of this script "
echo "20 seconds left to cancel"

sleep 30


CUSTOMER=$1
VERSION=$2
$NE_TYPE=$3
if [! -f /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NE_TYPE/conflist.cfg ]; then 
echo "cp /srv/customers/hotstorage/configs/templates/configlist.cfg /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NE_TYPE/conflist.cfg and edit the file "
echo " exiting"
exit 1
fi 

for CONFFILE in `cat /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NE_TYPE/conflist.cfg`; do
echo "- pipeline.id: $NENAME-$CONFFILE" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  path.config: \"/srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NENAME/$CONFFILE.conf\" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  pipeline.workers: 1" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  pipeline.batch.size: 60" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  pipeline.batch.delay: 20" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  queue.type: persisted" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
done


