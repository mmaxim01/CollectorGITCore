#!/bin/bash
set -x
export alias echo="echo -e"
ssh -p $PORT_LOCAL user@localhost "ls -lrt; exit" > /dev/null 2>&1
RC=$?
echo Please check the EMS with error code different than 0   ---">" > /var/log/MCC-STATUS.txt
echo " | "USGGSN EMS errorcode is $RCUSGGSN   >> /var/log/MCC-STATUS.txt


if [ "$RC" != "0" ] 
then
echo You got a fucking problem


fi

