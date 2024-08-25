#!/bin/bash

script_path="$0"
required_permissions=755

# Get the current permissions of the script in octal format
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of the disk usage health checker script are $current_permissions"
# Check if the current permissions are not equal to the required permissions
if [ "$current_permissions" -ne "$required_permissions" ]; then
	            echo "Adjusting script permissions to $required_permissions..."
		                    chmod "$required_permissions" "$script_path"
fi




# Setting the threshold for system at 80%
system_threshold=80

# Fetching the current disk usage of the root filesystem.
current_status=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

echo "At $current_status % risk status"

# Checking if the usage is greater than or equal to the threshold of 80 which was set above.
if [ "$current_status" -ge "$system_threshold" ]; then
	    # Setting up the the admin email and subject line along with body
	    admin_email_addr="adityavakharia@gmail.com"
            subject_line="Alert: Disk usage about to blow up, currently at ${current_status}%"
            body="Warning: The root filesystem is ${current_status}% full. Free up some space to continue playing!!."
	    # Send the email
	    echo "$body" | mail -s "$subject_line" "$admin_email_addr"
fi


