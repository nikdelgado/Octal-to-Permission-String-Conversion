#! /bin/bash

# Author: Nikolas Delgado
#
# Summary: Reads in two files:
# file 1 contains file names and permission strings
# file 2 contains file names and octal permissions
# translates the permission strings in file 1 to octal and prints the result
# translates the octal permissions in fule 2 to a string of permission characters and prints the results
#
# Options: none
#
# Arugments:
# Argument 1: a permission file u,u,u g,g,g o,o,o filename
# Arugment 2: an octals file U G O file name
# 
# Usage: ./hw8.sh permission_file octal_file
# 
# Example: ./hw8.sh perms.txt octals.txt


# Set arguments to variables
permission_file=$1
octal_file=$2

################################################
# Convert permissions into octal
# Arguments:
#	1. Permission File
# Outputs:
#	The function will print the file names
#	and the permissions for each file
# 	translated into octal numbers.
function perms_to_octal {
	
	echo "----- Translate Permissions to Octal -----"	

	#Check argument
	if [ ! -s $permission_file ] ; then
		echo "Argument 1 does not exist or is empty"
		exit 1
	fi
	
	# Cycle through file
	while read user group other file; do
		echo -ne $file "\t" 		
		
		# Set user_num var to count rwx values
		user_num=0
	
		# Set IFS to read comma separated values
		IFS=","
	
		# Cycle through each character
		for char in $user;
		do	
			case $char in
			r ) user_num=$((user_num + 4)) ;;
			w ) user_num=$((user_num + 2)) ;;
			x ) user_num=$((user_num + 1)) ;;
			esac
		done
		unset IFS
		# Print sum of user_num
		echo -n $user_num " "
		
		# Repeat above steps for $group and $other
		group_num=0
		IFS=","
		for char in $group;
		do
			case $char in
			r ) group_num=$((group_num + 4)) ;;
			w ) group_num=$((group_num + 2)) ;;
			x ) group_num=$((group_num + 1)) ;;
			esac
		done
		unset IFS
		echo -n $group_num " "
		
		other_num=0
		IFS=","
		for char in $other;
		do
			case $char in
			r ) other_num=$((other_num + 4)) ;;
			w ) other_num=$((other_num + 2)) ;;
			x ) other_num=$((other_num + 1)) ;;
			esac
		done
		unset IFS
		
		echo -ne $other_num "\n"

	done < $permission_file
}

perms_to_octal

#################################################
# Convert octals to permissions
# Arguments:
#	1. Octal File
# Outputs:
#	The function will list all the files
#	and print the permissions in rwx format
function octals_to_perm {

	echo "------ Translate Octal to Permissions -----"
	
	# Check to see if argument exists or is empty
	if [ ! -s $octal_file ]; then
		echo "Argument 2 does not exist or is empty"
		exit 1
	fi
	
	# Cycle through the file
	while read user group other file; do
		echo -ne $file "\t"
		
		# Cycle through each individual text segment in $user $group and $other
		for char in $user $group $other; do
			case $char in
			7 ) echo -n "rwx";;
			6 ) echo -n "rw-";;
			5 ) echo -n "r-w";;
			4 ) echo -n "r--";;
			3 ) echo -n "-wx";;
			2 ) echo -n "-w-";;
			1 ) echo -n "--x";;
			0 ) echo -n "---";;
			esac
		done
		echo -e "\n"	

	done < $octal_file
}

octals_to_perm
