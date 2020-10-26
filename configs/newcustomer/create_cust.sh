#!/bin/bash    
set -x
#title          :/srv/config/newcustomer/create_cust.sh
#description            
#author         :Marian Maxim
#date           :2019-09-26
#version: 1     :4.4.20(1)-release
customer=$1
version=$2



#                       
mkdir -p /srv/configs/ver/$version/$customer/
mkdir -p /srv/configs/customizations/customers/$customer/
cp -Rf /srv/configs/customizations/templates/* /srv/configs/customizations/customers/$customer/ 
mkdir -p /srv/customers/ver/$version/$customer/logs/cli_output/
cp -Rf /srv/configs/customizations/templates/cli_output/ /srv/customers/ver/$version/$customer/logs/cli_output/
chmod -Rf 775  /srv/configs/ver/$version
mkdir -p /srv/configs/customizations/$customer
chmod -Rf 775 /srv/configs/customizations/$customer
mkdir -p /srv/customers/ver/$version/$customer/tarred /srv/customers/ver/$version/$customer/csvfolders /srv/customers/ver/$version/$customer/recovery /srv/customers/ver/$version/$customer/logs /srv/customers/ver/$version/$customer/tarred/log/ /srv/customers/ver/$version/$customer/tarred/pm/
chmod -Rf 775 /srv/customers/ver/$version
mkdir -p /srv/customers/ver/$version/$customer/archive/
chmod 777 /srv/customers/ver/$version/$customer/archive/


echo " To create a new customer configs make sure to add the initial CSV files accordingly "
echo " Add network element folder with CSV files into /srv/configs/ver/$version/$customer" 
