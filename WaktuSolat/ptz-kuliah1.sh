#!/bin/bash
#lynx -dump "http://<ip address>/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&<preset camera no>" | mail -s "PTZ Kuliah pada $(date)" <insert email here>
#uncomment to use sample below to switch at PTZ preset 1
#lynx -dump "http://192.168.2.88/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&1"
