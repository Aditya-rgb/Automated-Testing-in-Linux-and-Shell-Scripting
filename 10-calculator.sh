#i/bin/bash

# Making the current script executable with the help of chmod command.
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Current permissons of this calculator script is $current_permissions"
# Checking if the current permissions are as same as the required permissions or not.
if [ "$current_permissions" -ne "$required_permissions" ]; then
	        echo "Adjusting script permissions to $required_permissions."
		        sudo chmod "$required_permissions" "$script_path"
fi


# Giving out prompts for entering the two numbers and the operation that needs to be performed.
read -p "Enter the first number: " num1
read -p "Enter the operator (+, -, *, /): " operator
read -p "Enter the second number: " num2

# Calculation logic according to the operator being given to this script, compariosn logic is being used. 
if [ "$operator" = "+" ]; then
	    result=$((num1 + num2))
elif [ "$operator" = "-" ]; then
	result=$((num1 - num2))
elif [ "$operator" = "*" ]; then
        result=$((num1 * num2))
elif [ "$operator" = "/" ]; then
	if [ "$num2" -eq 0 ]; then
		echo "Division by zero is not invalid according to rational numbers!!"
	        exit 1
	fi
	result=$((num1 / num2))
else
echo "Invalid operator."
exit 1
fi

# Display the result
echo "Result: $result"

