# Octal-to-Permission-String-Conversion

This script was written for a class assigment in my Unix scripting class.

Author: Nikolas Delgado

Summary: Reads in two files:
file 1 contains file names and permission strings
file 2 contains file names and octal permissions
translates the permission strings in file 1 to octal and prints the result
translates the octal permissions in fule 2 to a string of permission characters and prints the results

Options: none

Arugments:
Argument 1: a permission file u,u,u g,g,g o,o,o filename
Arugment 2: an octals file U G O file name
 
Usage: ./hw8.sh permission_file octal_file
 
Example: ./hw8.sh perms.txt octals.txt
