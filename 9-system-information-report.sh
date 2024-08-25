#!/bin/bash

# Making the current script executable with the help of chmod command.
script_path="$0"
required_permissions=755

# Getting the current permissions of the script in octal/number format.
current_permissions=$(stat -c "%a" "$script_path")
echo "Cuurent permissons of this system information report maker script is $current_permissions"
# Checking if the current permissions are as same as the required permissions or not.
if [ "$current_permissions" -ne "$required_permissions" ]; then
	                echo "Adjusting script permissions to $required_permissions."
			                        sudo chmod "$required_permissions" "$script_path"
fi


# Declaring the report txt file where the output will be shared!!
report="system_information_report.txt"

# Bash command to get the uptime of the system uptime in human readable format!!
system_uptime=$(uptime -p)

# Getting the memory usage of the system using the below command again in human readable format!!
memory_usage=$(free -h)

# This command extracts the CPU load averages for the last 1, 5, and 15 minutes...
cpu_load=$(top -bn1 | grep "load average" | awk '{print $12 $13 $14}')

# This command provides disk usage for the root filesystem in human-readable format!!
disk_usage=$(df -h /)

# This command counts the number of currently running processes. 
running_processes=$(ps -eaf | wc -l)

# Re-directing the output of this script as a report to the file.
{
	    echo "System Information Report"
	    echo "========================="
            echo
	    echo "System Uptime:"
	    echo "$system_uptime"
	    echo
	    echo "Memory Usage:"
	    echo "$memory_usage"
	    echo
	    echo "CPU Load:"
	    echo "$cpu_load"
	    echo
	    echo "Disk Usage:"
	    echo "$disk_usage"
	    echo
	    echo "Number of Running Processes:"
	    echo "$running_processes"

} > "$report"


echo "System information report has been saved here $report."

