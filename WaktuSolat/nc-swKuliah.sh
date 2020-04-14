#!/bin/sh
# Version 1.1 amin.afip@gmail.com  29 Nov 2019
# Script to ping/check port open on  camera and switch kuliah
# -q quiet
# -c nb of pings to perform
#############################################
# Initialize                                                  

FILE=/tmp/pingOK

########################################### 


#check if port open create file
# When PTZ optics is turn on, delay 1 minute before switching to preset 


if [ -f "$FILE" ] 
    then
#    echo "No action"
    echo "$(date) - day $(date +\%u) ~ no action loop" >> /home/pi/testPTZ.log
else 
    # Test open port , create file and logs 
    nc -z -w1 192.168.2.88 80 > /dev/null
	if [ $? -eq  0 ] 
        then
        #logging
		echo "$(date) - day $(date +\%u) ~  Camera kuliah active" > $FILE
  		echo "$(date) - day $(date +\%u) ~ Camera kuliah Active" >> /home/pi/testPTZ.log
        #echo "$(date) - Camera active" 
        #after time, delete file so that can start checking loop again
		echo "rm $FILE" | at now + 70 minute 	
		# Run a script to switch to ptz-kuliah after 1 min (it takes 1 min for the camera to set)
        /usr/bin/at now + 1 minute </home/pi/ptz-kuliah1.sh	
        
        #Meaning PTZ camera is not on, do nothing
        else
	       	#Camera inactive
	       	echo "$(date) - day $(date +\%u) ~  Camera kuliah InActive" >> /home/pi/testPTZ.log
    
	fi
fi
