#!/bin/sh

dst="/volume1/backups/YourPath/"

#TimeZone
datepath=`date +%d.%m.%Y`
datelog=`date +%Y.%m.%d`
logfile=$dst$datelog.txt

# Folder for Backup
VirtualMachines='/volume1/backups/VirtualMachines/'
status=$?

#Start Backup
echo "$(date +'%d-%b-%Y %R')" 
source=$VirtualMachines
dstpath='VirtualMachines_'
	echo 'Start Backup'  
	if [ ! -d $dst$dstpath$datepath]
	then
		mkdir $dst$dstpath$datepath 
	else
		echo 'Folder was created'
	fi
	cd "$source" 
		ls -d */ | while read -r vmpath
		do 
			if "$vmpath" -q "VeeamConfigBackup"
			then
				tar -cvzf "$dst$dstpath$datepath/${vmpath%/}.tar.gz" "$vmpath" 
			else
				cd "$source$vmpath"
				ls -t | head -n 3 | while read i
				do echo "$i"
					cp -pfr "$i" "$dst$dstpath$datepath"'/'"$vmpath" 
				done
			fi
		done
			#Show Status
			if [[ $status != 0 ]]; then
				#sendmail 
				end
			fi
	echo 'Backup Completed'
#
#sh
