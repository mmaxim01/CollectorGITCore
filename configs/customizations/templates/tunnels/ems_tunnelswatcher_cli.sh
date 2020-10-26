#!/bin/bash
set -x
#usage ./scriptname NumberOfTheJumpboxToBeUsed NameOfTheCustomer UserOnTheJumpboxToBeUsedforTunnelBuilding
#ems_tunnelswatcher.sh 1 whatevercustomer testuser

IP_1=10.10.10.10
IP_2=10.10.10.11
customer=$2
user=$3

if [ "$1" = "1" ]
then 
	jumpbox=$IP_1
else 
	if [ "$1" = "2" ]
	then
		jumpbox=$IP_2
	fi
fi
#	while read -r line
for line in `cat /srv/configs/customizations/$customer/tunnels/mappings_cli`; do
        	NE_TYPE=$(echo "$line" | awk -F ',' '{print $1}')
		HOST_NAME=$(echo "$line" | awk -F ',' '{print $2}')
		LOCAL_PORT=$(echo "$line" | awk -F ',' '{print $3}')
		USER=$(echo "$line" | awk -F ',' '{print $4}')
		NE_IP=$(echo "$line" | awk -F ',' '{print $5}')
		DEST_PORT=$(echo "$line" | awk -F ',' '{print $6}')
		COMMON_NAME=$(echo "$line" | awk -F ',' '{print $7}')
		ISTUNNELUP=$(ps -ef | grep ssh | grep ServerAliveInterval | grep -v grep | grep $LOCAL_PORT | awk '{print $20}' | cut -d':' -f1)
#		ssh -p $LOCAL_PORT $USER@localhost "pwd" > /dev/null 2>&1
#		RCTESTTUNNEL=$?
			if [ "$ISTUNNELUP" == "$LOCAL_PORT" ] #&& [ $RCTESTTUNNEL == "0" ]
				then
				echo "Tunnel for $COMMON_NAME on $LOCAL_PORT is already up "  >> /var/log/$customer_Tunnel_cli.log 
			else 
				ps -ef | grep -v grep | grep ssh | grep L | grep $LOCAL_PORT | awk '{print $2}' | xargs kill -9 
				autossh -4 -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" $user@$jumpbox -L $LOCAL_PORT:$NE_IP:$DEST_PORT -N &
				echo "Tunnel for $COMMON_NAME on $LOCAL_PORT has now been built "  >> /var/log/$customer_Tunnel_cli.log 

			fi
done
# done < "/srv/configs/customizations/vodafone/tunnels/mappings"


