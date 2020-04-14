#!/bin/bash
# Please put the LOG file in the place similar to script
delete_days=90
LOG=/tmp/delete_file.log
NOW=$(date +%c)
#start of script`
echo "Deleting file at $NOW" >> $LOG
find ~/test/. -mtime +$delete_days -type f | sort >> $LOG
echo "Deleting file at $NOW"
find ~/test/. -mtime +$delete_days -type f -delete | sort 
