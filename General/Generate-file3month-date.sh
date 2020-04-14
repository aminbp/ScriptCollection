#!/bin/bash

# Tool to generate 0 size file for the purpose of testing multiple file fron the date today going backward
# daily until end_day
# Created by Aminudin Afip on 14th April 2020

# Initilize variable

end_date=120
filename=test-file


#start of script
echo "$current_time"
for i in $(seq -f %003g 01 $end_date); do
         #calc_date=$(date -d "today - $i days +"%y%m%d%H%M%S"")
         calc_date=$(date -d "today - $i days" +"%Y%m%d%H%M")
	echo "Date sequence $calc_date file generated $filename-$i"
	touch -t $calc_date $filename-$i
done	
