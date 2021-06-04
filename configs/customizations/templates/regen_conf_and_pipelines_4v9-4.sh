#!/bin/bash -
set -x
#title          :regen_conf_and_pipelines_4v9-4.sh
#description
#author         :Marian Maxim
#date           :2021-04-21
#version:       :1.0


echo " remember to add new csv files in /srv/configs/ver/9-4/att/mcccsvfiles/  and update the list in /srv/configs/ver/9-4/att/conflist.cfg"
echo "YOU HAVE 1 MINUTE TO CANCEL THIS SCRIPT"
echo " EXECUT^ION OF THIS SCRIPT IS DESTRUCTIVE TO OLD PIPELINES"

sleep 70

cd /srv/configs/newcustomer/

./makelogstashconf_control_plane att 9-4 mcccontrolplane && ./makelogstashconf_user_planeEP1_ims att 9-4 mccuserplaneep1ims && ./makelogstashconf_user_planeEP2_ims att 9-4 mccuserplaneep2ims && ./makelogstashconf_user_planeEP1_reseller att 9-4 mccuserplaneep1reseller && ./makelogstashconf_user_planeEP2_reseller att 9-4 mccuserplaneep2reseller && ./makelogstashconf_user_planeEP1_consumer att 9-4 mccuserplaneep1consumer && ./makelogstashconf_user_planeEP2_consumer att 9-4 mccuserplaneep2consumer


cd /srv/configs/newcustomer/

./YML-gen.sh mcccontrolplane att 9-4 >> /srv/configs/ver/9-4/att/mcccontrolplane/pipelines.yml && ./YML-gen.sh mccuserplaneep1ims att 9-4 >> /srv/configs/ver/9-4/att/mccuserplaneep1ims/pipelines.yml && ./YML-gen.sh mccuserplaneep2ims att 9-4 >> /srv/configs/ver/9-4/att/mccuserplaneep2ims/pipelines.yml && ./YML-gen.sh mccuserplaneep1reseller att 9-4 >> /srv/configs/ver/9-4/att/mccuserplaneep1reseller/pipelines.yml && ./YML-gen.sh mccuserplaneep2reseller att 9-4 >> /srv/configs/ver/9-4/att/mccuserplaneep2reseller/pipelines.yml && ./YML-gen.sh mccuserplaneep1consumer att 9-4 >> /srv/configs/ver/9-4/att/mccuserplaneep1consumer/pipelines.yml && ./YML-gen.sh mccuserplaneep2consumer att 9-4 >> /srv/configs/ver/9-4/att/mccuserplaneep2consumer/pipelines.yml

