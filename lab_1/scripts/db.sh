#!/bin/bash

# program name

# no weri

Regex_var=[^0-9]
userdb_path=../data/users.db
backup_userbd_path=../data/$(date +'%Y-%m-%d-%H-%M-%S')-users.db


add_name() {
	read -p "Enter username: " username
	
	if [ -z "$username" ]
	then 
		echo "Username can'not be blank"
		add_name	
	elif ! [[ "$username" =~ $Regex_var ]]
	then 
		echo "Username must contain only letters"
		add_name
	elif [[ ! -z $username ]] 
	then 
	read -p "Enter role: " userrole	
	fi
}

add_newline_todb() {
	if [[ -f "$userdb_path" ]] 
	then 
		echo "$username,$userrole" >> $userdb_path
	else	
		echo "$username,$userrole" > $userdb_path
	fi	
}

help_function() {
	echo "This is the help function!"
}

backup_function(){
	cp $userdb_path $backup_userbd_path
}

restore_function() {
	latest_backup=$(ls ../data -tp | head -1)
	
	if [[ -f $latest_backup ]]
	then 
		echo "No backup file found."
		exit 1
	fi
	
	echo "restored"

	cat ../data/$latest_backup > $userdb_path 	
}

case $1 in 
	add) 
		add_name
		add_newline_todb;;
	backup) backup_function;;	
	restore) restore_function;;
	help | *) help_function;;
esac	

