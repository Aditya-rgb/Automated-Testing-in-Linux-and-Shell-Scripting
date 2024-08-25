#!/bin/bash

# Making this script executable using chmod command...
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of the user info checker script is $current_permissions"
# Checking if the current permissions are as same as the required permissions or not...
if [ "$current_permissions" -ne "$required_permissions" ]; then
	                echo "Adjusting script permissions to $required_permissions."
			                sudo chmod "$required_permissions" "$script_path"
fi


# Asking the user for which process they need to check..
read -p "Enter the name of the process which you want to check if its running or not : " process

# Fetching the user name
user=` echo $USER `
# Defining the log file and necesaary permissions to it.
sudo touch /home/"$user"/process_record.log
sudo chmod 777 /home/"$user"/process_record.log

# Checking if the process is running using ps and grep
if ps -eaf | grep -v grep | grep "$process" > : 
then
	    echo "$(date): $process is running." >> /home/"$user"/process_record.log
    else
	        echo "$(date): $process is not running. Starting the process..." >> /home/"$user"/process_record.log
		    sudo service "$process" start
		        echo "$(date): $process started successfully." >> /home/"$user"/process_record.log
fi
