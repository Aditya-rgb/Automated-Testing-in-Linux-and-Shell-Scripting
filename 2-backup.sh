#!/bin/bash

# Making the current script executable with the help of chmod command.
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of this backup script is $current_permissions"
# Checking if the current permissions are as same as the required permissions or not.
if [ "$current_permissions" -ne "$required_permissions" ]; then
	echo "Adjusting script permissions to $required_permissions."
	sudo chmod "$required_permissions" "$script_path"
fi





# Check if the directory argument is provided
if [ -z "$1" ]; then
	    echo "Please provide a directory."
	        exit 1
fi


# Making sure the target directory which is going to be backed up has correct traversing and reading permissions.
DIR="$1"
REQUIRED_PERMISSIONS=777

# Checking if the argument provided is a valid directory.
if [ ! -d "$DIR" ]; then
	    echo "Directory $DIR does not exist."
	        exit 1
fi

# Getting the current permissions of the target directory in number/octal format.
CURRENT_PERMISSIONS=$(stat -c "%a" "$DIR")

# Checking if the current permissions are as same as the required permissions.
if [ "$CURRENT_PERMISSIONS" -ne "$REQUIRED_PERMISSIONS" ]; then
	    echo "Adjusting directory permissions to $REQUIRED_PERMISSIONS..."
	        sudo chmod -R "$REQUIRED_PERMISSIONS" "$DIR"
fi

# Changing the current path to target directory
cd "$DIR" || exit

# Creating a tarball of all .txt files in the specified directory
sudo tar -czvf backup.tar.gz *.txt


echo "Backup completed. All .txt files have been archived to ${DIR}/backup.tar.gz."

# Creating a directory with a timestamp to unzip the backup
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
UNZIP_DIR="backup-${TIMESTAMP}"

# Creating the directory to unzip the backup
sudo mkdir -p /home/"$UNZIP_DIR"

# Unzipping the backup.tar.gz file into the new directory which we created in the above step.
sudo tar -xzvf backup.tar.gz -C /home/"$UNZIP_DIR"

echo "Backup has been unzipped to /home/${UNZIP_DIR}."




