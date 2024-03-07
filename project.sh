#!/bin/bash

echo -e "\n........welcom to Araby's program........\n"

check_path_to_creat() {
	while true; do
		read -p "Enter a path: " path
		if [ -d "$path" ]; then
			cd $path
			break
		else
			echo -e "\nInvalid path. Please try again\n"
		fi
	done
}

while true ; do
	read -p "file manger (1) system performance (2) quit (q): " input

	if [ $input = 1 ];then
		while true; do
			echo -e "Creat File or Dircotry (ct)\nback to main menu (9)"
			read -p "insert your option : " option
			case $option in
				"ct")
					check_path_to_creat
					while true; do
						read -p "to creat file (file) to creat dir (dir) back to main menu (back): " option2
						if [ $option2 = file ];then
							read -p "name of new file: " newfilename
							touch $newfilename
							break
						elif [ $option2 = dir ];then
							read -p "name of new dir: " newdirname
							mkdir $newdirname
							break
						elif [ $option2 = back ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;
				"9")
					break
					;;
				*)
					echo -e "\nInvalid input. Please try again\n"
					;;
			esac
		done


	elif [ $input = 2 ];then
		echo "system"

	elif [ $input = q ];then
		exit

	else
		echo "error input"
	fi

done
