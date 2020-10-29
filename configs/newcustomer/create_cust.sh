#!/bin/bash    
set -x
#title          :/srv/customers/hotstorage/configs/newcustomer/create_cust.sh
#description            
#author         :Marian Maxim
#date           :2019-09-26
#version: 1     :4.4.20(1)-release
customer=$1
version=$2



#                       
mkdir -p /srv/customers/hotstorage/configs/$version/$customer/
mkdir -p /srv/customers/hotstorage/configs/customizations/$version/$customer/ /srv/customers/hotstorage/configs/$version/$customer/NetElement_Template/
cp -Rf /srv/customers/hotstorage/configs/customizations/templates/* /srv/customers/hotstorage/configs/customizations/customers/$version/$customer/ && mv /srv/customers/hotstorage/configs/customizations/$version/$customer/conflist.cfg /srv/customers/hotstorage/configs/$version/$customer/NetElementTypeTemplate/conflist.cfg
mkdir -p /srv/customers/hotstorage/customers/$version/$customer/logs/cli_output/
cp /srv/customers/hotstorage/configs/customizations/templates/index_exmplate.json  /srv/customers/hotstorage/configs/$version/$customer/elk-ems-$version-$customer.json
cp -Rf /srv/customers/hotstorage/configs/customizations/templates/cli_output/ /srv/customers/hotstorage/customers/$version/$customer/logs/cli_output/
chmod -Rf 775  /srv/customers/hotstorage/configs/$version 
mkdir -p /srv/customers/hotstorage/configs/customizations/$version/$customer
chmod -Rf 775 /srv/customers/hotstorage/configs/customizations/$version/$customer
mkdir -p /srv/customers/hotstorage/customers/$version/$customer/tarred /srv/customers/hotstorage/customers/$version/$customer/csvfolders /srv/customers/hotstorage/customers/$version/$customer/recovery /srv/customers/hotstorage/customers/$version/$customer/logs /srv/customers/hotstorage/customers/$version/$customer/tarred/log/ /srv/customers/hotstorage/customers/$version/$customer/tarred/pm/
chmod -Rf 775 /srv/customers/hotstorage/customers/$version
mkdir -p /srv/customers/coldstorage/$version/$customer/archive/
chmod 777 /srv/customers/coldstorage/$version/$customer/archive/
mkdir -p /srv/customers/coldstorage/$version/$customer/configs/archive
chmod 777 /srv/customers/coldstorage/$version/$customer/configs/archive/


echo " To create a new customer configs make sure to add the initial CSV files accordingly "
echo " Add network element  CSV files into /srv/customers/hotstorage/configs/$version/$customer/NE_TYPE/" 
echo  " Remember to update the content of /srv/customers/hotstorage/configs/$version/$customer/elk-ems-$version-$customer.json " 
