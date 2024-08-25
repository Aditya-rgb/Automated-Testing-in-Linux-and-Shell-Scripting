#!/bin/bash

# Making the current script executable with the help of chmod command.
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of this text file analysis script is $current_permissions"
# Checking if the current permissions are as same as the required permissions or not.
if [ "$current_permissions" -ne "$required_permissions" ]; then
	        echo "Adjusting script permissions to $required_permissions."
		        sudo chmod "$required_permissions" "$script_path"
fi



# Making sure the txt file argument has correct traversing and reading permissions.
DIR="$1"
REQUIRED_PERMISSIONS=777

# Getting the current permissions of the target directory in number/octal format.
CURRENT_PERMISSIONS=$(stat -c "%a" "$DIR")

# Checking if the current permissions are as same as the required permissions.
if [ "$CURRENT_PERMISSIONS" -ne "$REQUIRED_PERMISSIONS" ]; then
	            echo "Adjusting txt file permissions to $REQUIRED_PERMISSIONS..."
		                    sudo chmod -R "$REQUIRED_PERMISSIONS" "$DIR"
fi


# Checking if a file argument is provided or not.
if [ -z "$1" ]; then
	    echo "How to run this text file analysis script : $0 <filename>"
	        exit 1
fi

file="$1"

# Checking if the provided argument is a valid file or not
if [ ! -f "$file" ]; then
	    echo "File $FILE does not exist, please place a valid file for the text analysis!!"
	        exit 1
fi

# Counting the number of lines
line_count=$(wc -l < "$file")

# Counting the number of words
word_count=$(wc -w < "$file")

# Counting the number of characters
character_count=$(wc -m < "$file")

# Display the counts
echo "File: $file"
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $character_count"

