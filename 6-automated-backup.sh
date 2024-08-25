#i/bin/bash


# Making the current script executable with the help of chmod command.
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of this automated backup script is $current_permissions"
# Checking if the current permissions are as same as the required permissions or not.
if [ "$current_permissions" -ne "$required_permissions" ]; then
	        echo "Adjusting script permissions to $required_permissions."
		        sudo chmod "$required_permissions" "$script_path"
fi





# Checking if the directory argument is provided or not :)
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

# Check if the current permissions are not equal to the required permissions
if [ "$CURRENT_PERMISSIONS" -ne "$REQUIRED_PERMISSIONS" ]; then
	            echo "Adjusting directory permissions to $REQUIRED_PERMISSIONS..."
		                    sudo chmod -R "$REQUIRED_PERMISSIONS" "$DIR"
fi

# Going inside the target directory
cd "$DIR" || exit

# Creating a tarball of all files in the specified directory
sudo tar -czvf documents_backup.tar.gz .

echo "Backup completed. All the files have been archived to ${DIR}/documents_backup.tar.gz."

# Fetching the user name
user_name=` echo $USER `

# Creating the directory to unzip the backup
sudo mkdir -p /home/"$user_name"/backups

# Moving the backed up direcotry to /home/user/backups folder...
sudo mv "$DIR"/documents_backup.tar.gz /home/"$user_name"/backups/

# Displaying the final message...
echo "documents_backup has been moved to /home/${user_name}/backups folder"
