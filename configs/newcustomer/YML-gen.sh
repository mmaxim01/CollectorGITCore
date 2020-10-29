#!/bin/bash
set -x 
#usage ./scriptname newtworkelementnameassample customer version 
# create /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NENAME/conflist.cfg like in the template folder 
CUSTOMER=$1
VERSION=$2


for CONFFILE in `cat /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/conflist.cfg`; do
echo "- pipeline.id: $NENAME-$CONFFILE" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  path.config: \"/srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/$NENAME/$CONFFILE.conf\" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  pipeline.workers: 1" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  pipeline.batch.size: 60" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  pipeline.batch.delay: 20" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
echo "  queue.type: persisted" >> /srv/customers/hotstorage/configs/$VERSION/$CUSTOMER/pipelines.yml
done

