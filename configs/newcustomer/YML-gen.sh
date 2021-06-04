#!/bin/bash
#set -x
NENAME=$1
CUSTOMER=$2
VERSION=$3
for CONFFILE in `cat /srv/configs/ver/$VERSION/$CUSTOMER/conflist.cfg`; do
echo "- pipeline.id: $NENAME-$CONFFILE"
echo "  path.config: \"/srv/configs/ver/$VERSION/$CUSTOMER/$NENAME/$CONFFILE.conf\" "
echo "  pipeline.workers: 1"
echo "  pipeline.batch.size: 2048"
echo "  pipeline.batch.delay: 15"
echo "  queue.type: persisted"
done



