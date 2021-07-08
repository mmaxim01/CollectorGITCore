#!/bin/bash -
set -x
#title          :logstash_recorvery.sh
#description
#author         :Marian Maxim
#date           :2021-04-21
#version:	:1.0


####DRP from collector NFS part ################

echo "starting recovery for Logstash-0 mcccontrolplane for NFS"
################# DRP  Logstash-0 #####################
ssh prodlogstash-0 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-0 "mount -a"
sleep 1
ssh prodlogstash-0 "df -h " 
sleep 1

echo "nfs installed on logstash-0 and started "
#######################################################

echo "sarting recovery for Logstash-1 mccuserplaneep1ims for NFS"
################### DRP Logstash-1 ######################
ssh prodlogstash-1 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-1 "mount -a"
sleep 1
ssh prodlogstash-1 "df -h" 
sleep 1

echo " nfs installed on logstash-1 and started"
#######################################################

echo "starting recovery for Logstash-2 mccuserplaneep1resellefor NFS r" 
################### DRP Logstash-2 ######################
ssh prodlogstash-2 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-2 "mount -a"
sleep 1
ssh prodlogstash-2 "df -h" 
sleep 1

echo " nfs installed on logstash-2 and started"
#######################################################

echo "starting recovery for Logstash-3 mccuserplaneep1consumer for NFS"
################### DRP Logstash-3 ######################
ssh prodlogstash-3 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-3 "mount -a"
sleep 1

echo " nfs installed on logstash-3 and started"
#######################################################

echo "starting recovery for Logstash-4 mccuserplaneep2ims for NFS"
################### DRP Logstash-4 ######################
ssh prodlogstash-4 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-4 "mount -a"
sleep 1
ssh prodlogstash-4 "df -h" 
sleep 1

echo "nfs installed on logstash-4 and started"
#######################################################

echo "starting recovery for Logstash-5 mccuserplaneep2reseller for NFS"
################### DRP Logstash-5 ######################
ssh prodlogstash-5 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-5 "mount -a"
sleep 1
ssh prodlogstash-5 "df -h" 
sleep 1

echo "nfs installed on logstash-5 and started"
#######################################################

echo "starting recovery for Logstash-6 mccuserplaneep2consumer"
################### DRP Logstash-5 ######################
ssh prodlogstash-6 "apt-get update && apt install nfs-common -y && mkdir -p /srv && echo "collector:/srv /srv nfs defaults 0 0" >> /etc/fstab"
sleep 1
ssh prodlogstash-6 "mount -a"
sleep 1
ssh prodlogstash-6 "df -h" 
sleep 1
echo "nfs installed on logstash-5 and started"
#######################################################
