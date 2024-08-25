#!/bin/bash
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of the file permission chcker script is $current_permissions"
# Checking if the current permissions are as same as the required permissions.
if [ "$current_permissions" -ne "$required_permissions" ]; then
       	echo "Adjusting script permissions to $required_permissions."
	sudo chmod "$required_permissions" "$script_path"
fi



# Checking if the file path is provided or not :)
if [ -z "$1" ]; then
	    echo "No such argument provided."
	        exit 1
fi

file="$1"

# Checkig if the file exists or not!!
if [ ! -e "$file" ]; then
	    echo "File $file does not exist."
	        exit 1
fi

# Checking permissions (Putting an echo command here to make sure the code is flowing!!
echo "Checking permissions for $file:"
echo "."
echo "."
echo "."
echo "."

# Checking the read permissions of the file
if [ -r "$file" ]; then
	    echo "Read permissions have been granted"
    else
	        echo "No Read permissions detected!!"
fi

# Checking the write permissions of the file
if [ -w "$file" ]; then
	    echo "Write permission have been granted"
    else
	        echo "No Write permissions detected!!"
fi

# Cehcking if the file has execute permissions
if [ -x "$file" ]; then
	    echo "Execute permissions have been granted"
    else
	        echo "No Execute permissions detected"
fi





