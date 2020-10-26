#!/bin/bash 
set -x
#usage ./scriptname customer 

customer=$1

### The script is removing files older then three days in the folders where the files are pilling up ### 

for i in `cat /srv/configs/customizations/customers/$customer/remove_old_files/folders_cleanup.txt`
    do 
        find $i -type f -name "*.csv" -mtime +4 -delete
    done

