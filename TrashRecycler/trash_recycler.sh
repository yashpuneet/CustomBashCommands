#!/usr/bin/bash

destdir="/home/yashpuneet/TRASH"

#Help function - lists commands for trashing
function helpTrash()
{
	echo ""
	echo "trash [arguments] - move specified files to trash"
	echo ""
	echo "emptytrash - empty contents of trash permanently"
	echo ""
	echo "listtrash - list all files in trash"
	echo ""
	echo "recoverfile [arguments] - recover specified files form trash - TO IMPLEMENT"
	echo ""
}

#Trash Function - This functions is used in place of rm to move files to a trash folder
function trash()
{
	files="$@"

	for file in ${files[@]}
	do
		mv "$file" $destdir
		echo "Moved $file to Trash"
	done
}

#Empty Trash function - Removes files in trash permanently
function emptytrash()
{
	listtrash
	echo -n "These files will be removed, press y to continue: "
	read choice

	case "$choice" in 
		y) rm -r $destdir; mkdir $destdir; echo "Removal Successful";;
		*) echo "Removal Cancelled"
	esac	
}

#List Trash function - Lists contsnts of trash
function listtrash()
{
	ls -R $destdir
}
