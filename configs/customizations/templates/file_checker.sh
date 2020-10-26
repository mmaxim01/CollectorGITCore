#!/bin/bash
set -x
#usage ./scriptname customer version
customer=$1
version=$2
FILE_CHECK=$(ls -ltr /mnt/samba/mounted/customers/csvfilesets/$version/$customer/* | tail -n 1 | awk '{print $9}')

FILE_ARRIVAL_TIME=$(ls -ltr /mnt/samba/mounted/customers/csvfilesets/$version/customer/* | tail -n 1 | awk '{print $6,$7,$8}')

TIMECHECK=$(echo $(( (`date +%s` - `stat -L --format %Y $FILE_CHECK`) > (3600) )))

if [ "$TIMECHECK" -eq 1 ]
    then
        echo -e "\n It seems there are no new files on the collector.\n\n The files are arriving in 30 minutes interval and the latest file is older then 1h. \n\n Please check the server where the files are arriving. \n\n Latest File Arrived at: $FILE_ARRIVAL_TIME \n\n Time of the check: $(date +"%c") \n\n Thank you in advance." | mailx -v -r "source@mailserver.com" -s "NO NEW FILES FOR DT" mail_address_list_separated@by.scpace.com
    else
	echo -e "\n$(date) Everything seems to be \e[39m[ \e[92mOK \e[39m]"
fi
