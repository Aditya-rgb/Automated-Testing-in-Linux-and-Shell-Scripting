#!/bin/bash
# Making the current script executable with the help of chmod command.
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of this directory maker script is $current_permissions"

# Checking if the current permissions are as same as the required permissions or not.
if [ "$current_permissions" -ne "$required_permissions" ]; then
	echo "Adjusting script permissions to $required_permissions."
        sudo chmod "$required_permissions" "$script_path"
fi

# Rest of the script
echo "Script is now executable with the correct permissions."



read -p "Enter the name of the user to create the directory structure : " user

echo "Welcome $user !!"
echo "Creating your directory structure..."
echo "."
echo "."
echo "."

sudo mkdir /home/$user
echo "Creating the projects directory..."
sudo mkdir /home/$user/projects/
sudo mkdir /home/$user/projects/project1
sudo mkdir /home/$user/projects/project2
sudo mkdir /home/$user/projects/project3

echo "Creating the documents sub-directory..."
sudo mkdir /home/$user/documents/

echo "Creating the downloads sub-directory..."
sudo mkdir /home/$user/downloads/








