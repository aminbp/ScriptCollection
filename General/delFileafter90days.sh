#!/bin/bash
# Please put the LOG file in the place similar to script
# Modified by Aminudin Afip 17 Apr 2020
# Delete file older than delete_days
delete_days=90
#store the log here, rename to the script directory location
LOG=/tmp/delete_file.log
#The directory that contains the file to be deleted. Kindly change any file ro read acess if you don't it to be deleted
DIR2DEL=/home/amin/del
# Set date variable to today
NOW=$(date +%c)

#start of script
echo "Deleting file from folder $DIR2DEL at $NOW" >> $LOG
find $DIR2DEL -mtime +$delete_days -type f | sort >> $LOG
echo "Deleting file from folder $DIR2DEL at $NOW"
#Show file to delete, uncomment to try, comment during production 
find $DIR2DEL -mtime +$delete_days -type f | sort
#Execute delete below, uncomment to execute
#find $DIR2DEL -mtime +$delete_days -type f -delete | sort 
