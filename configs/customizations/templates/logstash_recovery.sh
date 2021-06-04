#!/bin/bash -
#set -x
#title          :logstash_recorvery.sh
#description
#author         :Marian Maxim
#date           :2021-04-21
#version:       :1.0


####DRP from collector ################
###REBOOT LOGSTASH INSTANCES ###############
echo "killing logstash & rebooting "
ssh prodlogstash-0 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-0 "sleep 2 && ps -ef | grep logstash && reboot "

ssh prodlogstash-1 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-1 "sleep 2 && ps -ef | grep logstash && reboot "

ssh prodlogstash-2 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-2 "sleep 2 && ps -ef | grep logstash && reboot "

ssh prodlogstash-3 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-3 "sleep 2 && ps -ef | grep logstash && reboot "

ssh prodlogstash-4 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-4 "sleep 2 && ps -ef | grep logstash && reboot "

ssh prodlogstash-5 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-5 "sleep 2 && ps -ef | grep logstash && reboot "

ssh prodlogstash-6 "ps -ef | grep logstash | awk '{print $2}' | xargs kill -9 "
ssh prodlogstash-6 "sleep 2 && ps -ef | grep logstash && reboot "

echo " wait 3 mins for logstash instances to reboot "
sleep 180

echo "starting recovery for Logstash-0 mcccontrolplane "
################# DRP  Logstash-0 #####################
ssh prodlogstash-0 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-0 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-0 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-0 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-0 "cp /srv/configs/ver/9-4/att/mcccontrolplane/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-0 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-0 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mcccontrolplane.log  2>&1 &"
sleep 3
ssh prodlogstash-0 "ls -lrt /var/log/logstash/logstash-mcccontrolplane.log"
echo " logstash-0 stared"
#######################################################

echo "sarting recovery for Logstash-1 mccuserplaneep1ims"
################### DRP Logstash-1 ######################
ssh prodlogstash-1 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-1 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-1 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-1 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-1 "cp /srv/configs/ver/9-4/att/mccuserplaneep1ims/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-1 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-1 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mccuserplaneep1ims.log  2>&1 & "
sleep 3
ssh prodlogstash-1 "ls -lrt /var/log/logstash/logstash-mccuserplaneep1ims.log"
echo " logstash-1 started"
#######################################################

echo "starting recovery for Logstash-2 mccuserplaneep1reseller"
################### DRP Logstash-2 ######################
ssh prodlogstash-2 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-2 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-2 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-2 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-2 "cp /srv/configs/ver/9-4/att/mccuserplaneep1reseller/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-2 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-2 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mccuserplaneep1reseller.log  2>&1 & "
sleep 3
ssh prodlogstash-2 "ls -lrt /var/log/logstash/logstash-mccuserplaneep1reseller.log"
echo " logstash-2 started"
#######################################################

echo "starting recovery for Logstash-3 mccuserplaneep1consumer"
################### DRP Logstash-3 ######################
ssh prodlogstash-3 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-3 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-3 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-3 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-3 "cp /srv/configs/ver/9-4/att/mccuserplaneep1consumer/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-3 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-3 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mccuserplaneep1consumer.log  2>&1 & "
sleep 3
ssh prodlogstash-3 "ls -lrt /var/log/logstash/logstash-mccuserplaneep1consumer.log"
echo " logstash-3 started"
#######################################################

echo "starting recovery for Logstash-4 mccuserplaneep2ims"
################### DRP Logstash-4 ######################
ssh prodlogstash-4 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-4 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-4 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-4 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-4 "cp /srv/configs/ver/9-4/att/mccuserplaneep2ims/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-4 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-4 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mccuserplaneep2ims.log  2>&1 & "
sleep 3
ssh prodlogstash-4 "ls -lrt /var/log/logstash/logstash-mccuserplaneep2ims.log"
echo " logstash-4 started"
#######################################################

echo "starting recovery for Logstash-5 mccuserplaneep2reseller"
################### DRP Logstash-5 ######################
ssh prodlogstash-5 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-5 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-5 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-5 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-5 "cp /srv/configs/ver/9-4/att/mccuserplaneep2reseller/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-5 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-5 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mccuserplaneep2reseller.log  2>&1 & "
sleep 3
ssh prodlogstash-5 "ls -lrt /var/log/logstash/logstash-mccuserplaneep2reseller.log"
echo " logstash-5 started"
#######################################################

echo "starting recovery for Logstash-6 mccuserplaneep2consumer"
################### DRP Logstash-5 ######################
ssh prodlogstash-6 "rm -Rf /usr/share/logstash/data/plugins/inputs/file/.sincedb_*"
sleep 1
ssh prodlogstash-6 "rm -Rf /usr/share/logstash/data/queue/mcc*"
sleep 1
ssh prodlogstash-6 "rm /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-6 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-6 "cp /srv/configs/ver/9-4/att/mccuserplaneep2consumer/pipelines.yml /usr/share/logstash/config/pipelines.yml"
sleep 1
ssh prodlogstash-6 "ls -lrt /usr/share/logstash/config/pipelines.yml"
ssh prodlogstash-6 "/usr/share/logstash/bin/logstash --java-execution=false  >> /var/log/logstash/logstash-mccuserplaneep2consumer.log  2>&1 & "
sleep 3
ssh prodlogstash-6 "ls -lrt /var/log/logstash/logstash-mccuserplaneep2consumer.log"
echo " logstash-5 started"
#######################################################

echo " Logstash instances updated with new pipelines"
