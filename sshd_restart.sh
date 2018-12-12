#!/bin/bash
#Desc: Script To Start SSH Service If Not Running
op=`sudo service sshd status`
OUT="/var/log/sshd_service_log"
if [[ $op == *"running"* ]]; 
then  
 echo "`date +%D+%T` : SSH Service Is Healthy" >> $OUT
else
 echo "`date +%D+%T` : SSH Service Is Not Healthy, So Restarting.." >> $OUT
 service sshd restart 
 if [[ $? != 0 ]]; then
   echo "`date +%D+%T` : Problem In Restarting SSHD Services, Please Check" >> $OUT
 fi
fi

