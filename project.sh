#!/bin/bash

echo -e "\n........welcom to Araby's program........\n"

check_path_to_creat() {
	while true; do
		read -p "Enter a path: " path
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
		read -p "copy from: " path2
		if [ -e "$path2" ]; then
			read -p "copy to: " path3
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
		read -p "move from: " path2
		if [ -e "$path2" ]; then
			read -p "move to: " path3
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
		read -p "path of file or dir to rename: " path4
		if [ -e "$path4" ]; then
			cd $path4
			read -p "old name: " oldname
			read -p "new name: " newname
			read -p "are you sure to rename $oldname to $newname [y] or press anything else if you don't: " confirm
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
	read -p "file manger (1) system performance (2) quit (q): " input

	if [ $input = 1 ];then
		while true; do
			echo -e "Creat File or Dircotry\t(ct)\nCopy File or Dircotry\t(cp)\nRename File or Dirctory\t(re)\nMove File or Dirctory\t(mv)\nDelete File or Dirctory\t(de)\nBack to main menu\t(9)"
			read -p "insert your option : " option
			case $option in
				"ct")
					check_path_to_creat
					while true; do
						read -p "to creat file (file) to creat dir (dir) back to file manger menu (back): " option2
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
				"de")
					check_path_to_creat
					while true; do
						read -p "to delete file (file) to delete dir (dir) back to file manger menu (back): " option6
						if [ $option6 = file ];then
							read -p "name of file: " fname
							read -p "are you sure do delete "$fname" [y] press any key to ignore: " conf
							if [ $conf = y ];then
								rm $fname
								break
							else
								break
							fi
						elif [ $option6 = dir ];then
							read -p "name of dir: " dname
							read -p "are you sure do delete "$dname" [y] press any key to ignore: " conf1
							if [ $conf1 = y ];then
								rm -r $dname
								break
							else
								break
							fi
						elif [ $option6 = back ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;

				"cp")
					while true; do
						read -p "To copy file (file) to copy dirctory (dir) back to file manger menu (back): " option3
						if [ $option3 = file ];then
							check_path_to_copy
						elif [ $option3 = dir ];then
							check_path_to_copy
						elif [ $option3 = back ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;
				"mv")
					while true; do
						read -p "To move file (file) to move dirctory (dir) back to file manger menu (back): " option5
						if [ $option5 = file ];then
							check_path_to_move
						elif [ $option5 = dir ];then
							check_path_to_move
						elif [ $option5 = back ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;

				"re")
					while true; do
						read -p "To rename file (file) to rename dirctory (dir) back to file manger menu (back): " option4
						if [ $option4 = file ];then
							check_path_to_rename
						elif [ $option4 = dir ];then
							check_path_to_rename
						elif [ $option4 = back ];then
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
		while true; do
			echo -e "\nSystem's operating system[operating system,hostname,uptime or date]\t(1)\nMemory informations\t(2)\nBack to main menu\t(9)"
			read -p "insert your option : " option0
			case $option0 in
				"1")
					while true; do
						read -p $'\nDisplay operating system\t(op)\nDisplay hostname\t(ht)\nDisplay uptime\t(ut)\nDisplay the current date/time\t(date)\nBack to system performance menu\t(back): ' option7
						if [ $option7 = op ];then
							echo "..............................."
							cat /etc/os-release
							echo "..............................."
						elif [ $option7 = ht ];then
							echo "..............................."
							hostnamectl
							echo "..............................."
						elif [ $option7 = ut ];then
							echo "..............................."
							uptime
							echo "..............................."
						elif [ $option7 = date ];then
							echo "..............................."
							date
							echo "..............................."
						elif [ $option7 = back ];then
							break
						else
							echo -e "\nInvalid input. Please try again\n"
						fi
					done
					;;
				"2")
					echo "............................................"
					free
					echo "............................................"
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
