#!/bin/bash


script_path="$0"
required_permissions=755

# Get the current permissions of the script in octal format
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of the user info checker script is $current_permissions"
# Check if the current permissions are not equal to the required permissions
if [ "$current_permissions" -ne "$required_permissions" ]; then
	        echo "Adjusting script permissions to $required_permissions."
		sudo chmod "$required_permissions" "$script_path"
fi



# Displaying the Header of the tabular format output
printf "%-20s %-20s\n" "Information" "Details"
printf "%-20s %-20s\n" "-----------" "-------"

# Displaying the username of the current user.
printf "%-20s %-20s\n" "Username:" "$USER"

# Displaying the user ID, -u for the user id..
printf "%-20s %-20s\n" "User ID:" "$(id -u)"

# Displaying the group ID, -g for the group id.
printf "%-20s %-20s\n" "Group ID:" "$(id -g)"

# Displaying  the home directory.
printf "%-20s %-20s\n" "Home Directory:" "$HOME"

# Displaying the shell being used with it's path variable.
printf "%-20s %-20s\n" "Shell:" "$SHELL"


# Above code will display the all the necesaary details of the USER in tabular format. :) Happy Learning!!
