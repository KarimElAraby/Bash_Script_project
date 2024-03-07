#!/bin/bash

echo "welcom to Araby's program"

while true ; do
	read -p "file manger (1) system performance (2) quit (q): " input

	if [ $input = 1 ];then
		echo "file"

	elif [ $input = 2 ];then
		echo "system"

	elif [ $input = q ];then
		exit

	else
		echo "error input"
	fi

done
