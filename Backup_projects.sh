#!/bin/sh

dst="/volume1/backups/YourPath/"

#TimeZone
datepath=`date +%d.%m.%Y`
datelog=`date +%Y.%m.%d`
logfile=$dst$datelog.txt

# Folder for backup
ProjectsFiles='/volume1/Shares/Projects/'
status=$?

#Начинаем бэкапить
echo "$(date +'%d-%b-%Y %R')" 
source=$ProjectsFiles
dstpath='ProjectsFiles_'
	echo 'Start backup'  
		if [ ! -d $dst$dstpath$datepath]
		then
			mkdir $dst$dstpath$datepath 
		else
			echo 'Folder created'
		fi
		cd "$source" 
			ls -d */ | while read i
				do tar -cvzf "$dst$dstpath$datepath/${i%/}.tar.gz" "$i" 
			done
#Show Status
		if [[ $status != 0 ]]; then
			#sendmail 
		fi
	echo 'Bakcup Completed
echo "$(date +'%d-%b-%Y %R')" 
#sh
