#!/bin/bash

zenity --notification --text="Welcome to the script with GUI"

check_path_to_creat() {
	while true; do
		path=$(zenity --file-selection --directory)
		cd $path
		break
	done
}
check_path_to_copy() {
	while true; do
		path2=$(zenity --list --title="Copy Option" --text="Select your option[file/Dirctory]" --column="ID" --column="Option" --cancel-label="Back" 1 file 2 dirctory --width=400 --height=500)
		if [[ $? -eq 1 ]]; then
    			break
		elif [ $path2 = 1 ]; then
			cp -r $(zenity --file-selection) $(zenity --file-selection --directory)
			break
		elif [ $path2 = 2 ];then
			cp -r $(zenity --file-selection --directory) $(zenity --file-selection --directory)
			break
		fi
	done
}
check_path_to_move() {
	while true; do
		path2=$(zenity --list --title="Move Option" --text="Select your option[file/Dirctory]" --column="ID" --column="Option" --cancel-label="Back" 1 File 2 Dirctory --width=400 --height=500)
		if [[ $? -eq 1 ]]; then
			break
		elif [ $path2 = 1 ];then
			mv $(zenity --file-selection) $(zenity --file-selection --directory)
			break
		elif [ $path2 = 2 ];then
			mv $(zenity --file-selection --directory) $(zenity --file-selection --directory)
			break
		fi
	done
}
check_path_to_rename() {
	while true; do
		path2=$(zenity --list --title="Copy Option" --text="Select your option[File/Dirctory]" --column="ID" --column="Option" --cancel-label="Back" 1 File 2 Dirctory --width=400 --height=500)
		if [[ $? -eq 1 ]]; then
			break
		elif [ $path2 = 1 ]; then
			oldname=$(zenity --file-selection)
			newname=$(zenity --entry --title="Rename File" --text="enter the new name:" --width=340 --height=200)
			 if zenity --question --title="Confirm Rename" --text="Are you sure you want to Rename $oldname to $newname?" --no-wrap
			 then
				mv $oldname $newname
				break
			fi
		elif [ $path2 = 2 ];then
			oldname=$(zenity --file-selection)
                        newname=$(zenity --entry --title="Rename File" --text="enter the new name:" --width=340 --height=200)
			if zenity --question --title="Confirm Rename" --text="Are you sure you want to Rename $oldname to $newname?" --no-wrap
			then
                                mv $oldname $newname
				break
			fi
		fi
	done
}
memory() {
	echo -e "\n..................Memory Usage........................\n"
	free
	echo -e "\n......................................................"
}
cpu() {
	echo -e "\n...............CPU Usage........................\n"
       	top -bn1 | awk '{print echo "\t" $9,echo "\t",$12}' | sed '1,6d' | head -11
	echo -e "\n................................................"
}
disk() {
	echo -e "\n...............Disk Space........................\n"
	df -h
	echo -e "\n................................................."
}
while true ; do
	input=$(zenity --list --title="Araby's Program" --text="Select your option" --column="ID" --column="Option" --cancel-label="Quit" 1 File_Manger 2 System_Performance --width=400 --height=500)
	if [[ $? -eq 1 ]]; then
		break
	elif [ $input = 1 ];then
		while true; do
			option=$(zenity --list --title="File Manger" --text="Select your option" --column="ID" --column="options" --cancel-label="Back" 1 create 2 copy 3 rename 4 move 5 Delete 6 search 7 file_permision 8 backup_and_restore --width=400 --height=500)
			case $option in
				"1")
					check_path_to_creat
					while true; do
						option2=$(zenity --list --title="Creating File or Dirctory" --text="Select your option" --column="ID" --column="Option" --cancel-label="Back" 1 File 2 Dirctory --width=400 --height=500)
						if [[ $? -eq 1 ]]; then
							break
						elif [ $option2 = 1 ];then
							newfilename=$(zenity --entry --title="Creating new file" --text="File name:" --width=340 --height=200)
							touch $newfilename
							break
						elif [ $option2 = 2 ];then
							newdirname=$(zenity --entry --title="Creating new Dirctory" --text="Dirctory name:" --width=340 --height=200)
							mkdir $newdirname
							break
						fi
					done
					;;
				"5")
					while true; do
						option6=$(zenity --list --title="Deleting File or Dirctory" --text="Select your option" --column="ID" --column="Option" --cancel-label="Back" 1 File 2 Dirctory --width=400 --height=500)
						if [[ $? -eq 1 ]]; then
							break
						elif [ $option6 = 1 ];then
							delfil=$(zenity --file-selection)
							if zenity --question --title="Confirm deletion" --text="Are you sure you want to delete $delfil\tfile?" --no-wrap
							then
								rm $delfil
								break
							else
								break
							fi
						elif [ $option6 = 2 ];then
							deldir=$(zenity --file-selection --directory)
							if zenity --question --title="Confirm deletion" --text="Are you sure you want to delete $deldir  Dirctory?" --no-wrap
							then
								rm -r $deldir
								break
							else
								break
							fi
						elif [ $option6 = 9 ];then
							break
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
						search=$(zenity --list --title="Searching" --text="Searching by.." --column="ID" --column="Option" --cancel-label="Back" 1 Time 2 Name 3 Size 4 Type --width=400 --height=500)
						if [[ $? -eq 1 ]]; then
							break
						elif [ $search = 1 ];then
							num=$(zenity --entry --title="Searching by modification date" --text="How many days have passed since the last modification?:" --width=340 --height=200)
							zenity --info --title="Results of searching" --text="$(find -mtime $num)" --no-wrap
						elif [ $search = 2 ];then
							nam=$(zenity --entry --title="Searching by Name" --text="What's [File/Dirctory]'s Name?" --width=340 --height=200)
							zenity --info --title="Results of searching" --text="$(find -iname $nam)" --no-wrap
						elif [ $search = 3 ];then
							siz=$(zenity --entry --title="Searching by Size" --text="What's [File/Dirctory]'s Size\ntips[(M)\tmega\t(G)\tgiga\t(k)\tkilobyte]\nexample (21M) (2G) (150k)" --width=340 --height=200)
							zenity --info --title="Results of searching" --text="$(find -size $siz)" --no-wrap
						elif [ $search = 4 ];then
							typ=$(zenity --entry --title="Searching by Type" --text="What's [File/Dirctory]'s Type?\n(f)\tfile\t(d)\tdirctory" --width=340 --height=200)
							zenity --info --title="Results of searching" --text="$(find -type $typ)" --no-wrap
						fi
					done
					;;
				"7")
					while true; do
						opt=$(zenity --list --title="File permision & owenrship" --text="Select your option" --column="ID" --column="Option" --cancel-label="Back" 1 "File permision" 2 "Owner&Group permision" --width=400 --height=500)
						if [[ $? -eq 1 ]]; then
							break
						elif [ $opt = 1 ];then
							while true; do
								name=$(zenity --file-selection)
								opt2=$(zenity --list --title="File permision" --text="Select your option" --column="ID" --column="options" --cancel-label="Back" 1 "User only" 2 "User & Group" 3 "User & Others" 4 "Group only" 5 "Group & Others" 6 "Others only" 7 "All[User, Group & Others]" --width=400 --height=500)
								case $opt2 in
									"1")
										opt3=$(zenity --entry --title="Permision for User only" --text="what's permision you want to add or remove from user only?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
										sudo chmod u$opt3 $name
										break
										;;
									"2")
										opt3=$(zenity --entry --title="Permision for User&Group" --text="what's permision you want to add or remove from user&group?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
                                                                                sudo chmod u$opt3 $name
										sudo chmod g$opt3 $name
										break
                                                                                ;;
									"3")
										opt3=$(zenity --entry --title="Permision for User&Others" --text="what's permision you want to add or remove from user&others?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
                                                                                sudo chmod u$opt3 $name
										sudo chmod o$opt3 $name
										break
                                                                                ;;
									"4")
										opt3=$(zenity --entry --title="Permision for Group only" --text="what's permision you want to add or remove from group only?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
                                                                                sudo chmod g$opt3 $name
										break
                                                                                ;;
									"5")
										opt3=$(zenity --entry --title="Permision for Group&Others" --text="what's permision you want to add or remove from group&others?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
                                                                                sudo chmod g$opt3 $name
										sudo chmod o$opt3 $name
										break
                                                                                ;;
									"6")
										opt3=$(zenity --entry --title="Permision for Others only" --text="what's permision you want to add or remove from others only?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
                                                                                sudo chmod o$opt3 $name
										break
                                                                                ;;
									"7")
										opt3=$(zenity --entry --title="Permision for All" --text="what's permision you want to add or remove from All[user, group & others]?\ntips:\t[(+) to add (-) to remove]\nex:\t +r, +xw or +rw\n(r)\tread\t(w)\twrite\t(x)\texcute" --width=340 --height=200)
                                                                                sudo chmod u$opt3 $name
										sudo chmod g$opt3 $name
										sudo chmod o$opt3 $name
										break
                                                                                ;;
									*)
										if [[ $? -eq 1 ]]; then
											break
										fi
										;;
								esac
							done
						elif [ $opt = 2 ];then
							while true; do
								name=$(zenity --file-selection)
								opt4=$(zenity --list --title="File permision" --text="Select your option" --column="ID" --column="options" --cancel-label="Back" 1 "Change Owner only" 2 "Change Groupe only" 3 "Change both[owner&group]" --width=400 --height=500)
								case $opt4 in
									"1")
										nme=$(zenity --entry --title="Changing ownership for owner only" --text="Enter new user name: " --width=340 --height=200)
										sudo chown $nme $name
										break
										;;
									"2")
										gnme=$(zenity --entry --title="Changing ownership for group only" --text="Enter new group name: " --width=340 --height=200)
										sudo chgrp $gnme $name
										break
										;;
									"3")
										both=$(zenity --entry --title="Changing ownership for owner&group" --text="Enter new user&group name:\n\nex: newuser:newgroup" --width=340 --height=200)
										sudo chown $both $name
										break
										;;
									*)
										if [[ $? -eq 1 ]]; then
											break
										fi
										;;
								esac
							done
							break
						fi
					done
					;;
				"8")
					while true; do
						opp=$(zenity --list --title="Backup & Restore" --text="Select your option" --column="ID" --column="Option" --cancel-label="Back" 1 "Backup" 2 "Restore" --width=400 --height=500)
						if [[ $? -eq 1 ]]; then
							break
						elif [ $opp = 1 ];then
							check_path_to_creat
							fdname=$(zenity --entry --title="Backup" --text="File or Dirctory name:" --width=340 --height=200)
							tar -cvf $fdname.tar $fdname
							break
						elif [ $opp = 2 ];then
							check_path_to_creat
							fdnm=$(zenity --entry --title="Restore" --text="File or Dirctory name:" --width=340 --height=200)
                                                        tar -xvf $fdnm
							break
						fi
					done
					;;
				*)
					if [[ $? -eq 1 ]]; then
						break
					fi
					;;
			esac
		done
	elif [ $input = 2 ];then
		while true; do
			option0=$(zenity --list --title="System Performance" --text="Select your option" --column="ID" --column="options" --cancel-label="Back" 1 "System's information" 2 "Memory" 3 "CPU Usage" 4 "Disk Space" 5 "Logging & Report" --width=400 --height=500)
			case $option0 in
				"1")
					while true; do
						option7=$(zenity --list --title="System's informations" --text="Select your option" --column="ID" --column="Option" --cancel-label="Back" 1 "Display operating system" 2 "Display hostname" 3 "Display uptime" 4 "Display the current date/time" --width=400 --height=500)
						if [[ $? -eq 1 ]]; then
							break
						elif [ $option7 = 1 ];then
							zenity --info --title="Operating System" --text="$(cat /etc/os-release)" --no-wrap
						elif [ $option7 = 2 ];then
							zenity --info --title="Host Name" --text="$(hostnamectl)" --no-wrap
						elif [ $option7 = 3 ];then
							zenity --info --title="UP Time" --text="$(uptime)" --no-wrap
						elif [ $option7 = 4 ];then
							zenity --info --title="Current date/time" --text="$(date)" --no-wrap
						fi
					done
					;;
				"2")
					zenity --info --title="Memory Usage" --text="$(free)" --no-wrap
					;;
				"3")
					zenity --info --title="CPU Usage" --text="$(top -bn1 | awk '{print echo "\t" $9,echo "\t",$12}' | sed '1,6d' | head -11)" --no-wrap
					;;
				"4")
					zenity --info --title="Disk Space" --text="$(df -h)" --no-wrap
					;;
				"5")
					memory > ~/karim/amir/log.txt
					disk >> ~/karim/amir/log.txt
					cpu >> ~/karim/amir/log.txt
			#		cat ~/karim/amir/log.txt
					zenity --info --title="Report for hardware usage" --text="$(cat ~/karim/amir/log.txt)" --no-wrap
					;;
				"9")
					break
					;;
				*)
					if [[ $? -eq 1 ]]; then
						break
					fi
					;;
				esac
			done
	fi
done
