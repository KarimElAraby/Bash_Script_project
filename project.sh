#!/bin/bash

echo -e "\n........welcom to Araby's program........\n"

check_path_to_creat() {
	while true; do
		read -p $'\nEnter a path: ' path
		if [ -e "$path" ]; then
			cd $path
			break
		else
			echo -e "\nInvalid path. Please try again\n"
		fi
	done
}
check_path_to_copy() {
	while true; do
		read -p $'\ncopy from: ' path2
		if [ -e "$path2" ]; then
			read -p $'\ncopy to: ' path3
			if [ -e "$path3" ]; then
				cp -r $path2 $path3
				break
			else
				echo -e "\nInvalid path. Please try again\n"
			fi
		else
			echo -e "\nInvalid path. Please try again\n"
		fi
	done
}
check_path_to_move() {
	while true; do
		read -p $'\nmove from: ' path2
		if [ -e "$path2" ]; then
			read -p $'move to: ' path3
			if [ -e "$path3" ]; then
				mv $path2 $path3
				break
			else
				echo -e "\nInvalid path. Please try again\n"
			fi
		else
			echo -e "\nInvalid path. Please try again\n"
		fi
	done
}
check_path_to_rename() {
	while true; do
		read -p $'\npath of file or dir to rename: ' path4
		if [ -e "$path4" ]; then
			cd $path4
			read -p "old name: " oldname
			read -p "new name: " newname
			read -p "are you sure to rename $oldname to $newname [y] or press any key to ignore: " confirm
			if [ $confirm = y ];then
				mv $oldname $newname
				break
			else
				break
			fi
		else
			echo -e "\nInvalid path. Please try again\n"
		fi
	done
}
while true ; do
	read -p $'File manger\t\t(1)\nSystem performance\t(2)\nQuit\t\t\t(q): ' input

	if [ $input = 1 ];then
		while true; do
			echo -e "\nCreat File or Dircotry\t(1)\nCopy File or Dircotry\t(2)\nRename File or Dirctory\t(3)\nMove File or Dirctory\t(4)\nDelete File or Dirctory\t(5)\nSearch\t\t\t(6)\nBack to main menu\t(9)\n"
			read -p "insert your option : " option
			case $option in
				"1")
					check_path_to_creat
					while true; do
						read -p $'\nCreat file\t\t\t(f)\nCreat dirctory\t\t\t(d)\nBack to file manger menu\t(b): ' option2
						if [ $option2 = f ];then
							read -p "name of new file: " newfilename
							touch $newfilename
							break
						elif [ $option2 = d ];then
							read -p "name of new dir: " newdirname
							mkdir $newdirname
							break
						elif [ $option2 = b ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;
				"5")
					check_path_to_creat
					while true; do
						read -p $'\nName of File or Dirctory you want to delete: ' option6
						if [ -f $option6 ];then
							read -p "are you sure do delete File:- "$option6" [y] press any key to ignore: " conf
							if [ $conf = y ];then
								rm $option6
								break
							else
								break
							fi
						elif [ -d $option6 ];then
							read -p "are you sure do delete Dirctory:- "$option6" [y] press any key to ignore: " conf1
							if [ $conf1 = y ];then
								rm -r $option6
								break
							else
								break
							fi
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;

				"2")
					while true; do
							check_path_to_copy
							break
					done
					;;
				"4")
					while true; do
							check_path_to_move
							break
					done
					;;

				"3")
					while true; do
							check_path_to_rename
							break
					done
					;;
				"6")
					while true; do
						read -p $'\nsearch by time\t\t\t(1)\nsearch by name\t\t\t(2)\nsearch by size\t\t\t(3)\nsearch by type\t\t\t(4)\nBack to file manger menu\t(9): ' search
						if [ $search = 1 ];then
							read -p "modified time by days: " num
							find -mtime $num
						elif [ $search = 2 ];then
							read -p "Insert the name: " nam
							find -iname $nam
						elif [ $search = 3 ];then
							read -p "Insert the size: " siz
							find -size $siz
						elif [ $search = 4 ];then
							read -p $'Insert the Type\nFiles\t\t(f)\nDirctories\t(d): ' typ
							find -type $typ
						elif [ $search = 9 ];then
							break
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
		while true; do
			echo -e "\nSystem's operating system\t(1)\nMemory informations\t\t(2)\nCPU Usage\t\t\t(3)\nBack to main menu\t\t(9)"
			read -p "insert your option : " option0
			case $option0 in
				"1")
					while true; do
						read -p $'\nDisplay operating system\t(1)\nDisplay hostname\t\t(2)\nDisplay uptime\t\t\t(3)\nDisplay the current date/time\t(4)\nBack to system performance menu\t(9): ' option7
						if [ $option7 = 1 ];then
							echo -e "\n................Operating System...............\n"
							cat /etc/os-release
							echo -e "\n..............................................."
						elif [ $option7 = 2 ];then
							echo -e "\n...............Host-Name................\n"
							hostnamectl
							echo "............................................."
						elif [ $option7 = 3 ];then
							echo -e "\n...............Uptime................\n"
							uptime
							echo -e "\n....................................."
						elif [ $option7 = 4 ];then
							echo -e "\n.............Current Date..................\n"
							date
							echo -e "\n..........................................."
						elif [ $option7 = 9 ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;
				"2")
					echo -e "\n..................Memory Usage........................"
					free
					echo "......................................................"
					;;
				"3")
					echo -e "\n...............CPU Usage........................"
					top -bn1 | awk '{print echo "\t" $9,echo "\t",$12}' | sed '1,6d' | head -11
					echo "................................................"
					;;
				"9")
					break
					;;
				*)
					echo -e "\nInvalid input. Please try again\n"
				esac
			done


	elif [ $input = q ];then
		exit

	else
		echo "error input"
	fi

done
