# Bash Script for File Management and System Monitoring

## Project Description

The Bash script developed in this project monitors various aspects of a Linux system and provides real-time insights into system performance. It also serves as a file management tool that helps users efficiently manage files and directories. The script collects data on CPU usage, memory usage, and disk space, and displays the information in a user-friendly format. the script includes functionalities for creating, copying, moving, renaming, deleting files and directories, as well as searching for files based on specified criteria.


## Project Features

### 1- Interactive Menu:
    
a- The script presents users with an interactive menu that offers options for system monitoring and file management operations.
    
b- The menu utilizes the select statement to display options and handle user input


### 2- Error Handling:

a- The script implements error handling mechanisms to validate user input and handle exceptions gracefully.
    
b- Informative error messages are provided when operations fail due to incorrect input or other issues.


### 3- File and Directory Operations:

a- Create: Allows users to create files and directories by providing the desired names and target locations.
    
b- Copy: Enables users to copy files and directories to specific destinations.
    
c- Move: Allows users to move files and directories to different locations.
    
d- Rename: Provides the ability to rename files and directories. Includes confirmation prompts
    
e- Delete: Allows users to delete files and directories. Includes confirmation prompts to avoid accidental data loss.


### 4- File Search:

 Users can search for files based on specified criteria such as file name, file type, file size, and modification date.


### 5- Permissions Management:

a- Users can change file permissions (chmod) and ownership (chown) using the script.
    
b- The script provides options to specify permission modes and user/group ownership.

    
### 6- Backup and Restore:

a- The script includes backup and restore functionalities to create backups of files and directories and restore them when needed.
    
b- The tar command is utilized for creating and extracting backups.

    
### 7- System Information Display:

Basic system information, including the operating system, hostname, uptime, and current date/time, is displayed.

    
### 8- CPU Usage Monitoring:

The script retrieves CPU usage statistics and displays the current CPU usage percentage.

  
### 9- Memory Usage Monitoring:

Memory usage statistics are retrieved, and information such as total available memory, used memory, and free memory is displayed.

### 10- Disk Space Monitoring:

Disk space usage statistics are retrieved, and information such as total disk space, used space, and available space for each mounted filesystem is displayed.

### 11- Logging and Reporting:

The script generates a summary report of system metrics and saves it to a specified location.

## Command Line Interface ( CLI )

![Screenshot from 2024-05-05 17-57-45](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/0505ab52-5bc7-49e4-870f-7b1db27b8b7b)
![Screenshot from 2024-05-05 17-59-41](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/cd1ca5d8-8247-458f-a821-6eb6cb0068dd)
![Screenshot from 2024-05-05 18-02-41](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/68e29a2b-b622-41eb-8fe2-0668834cb64b)

## Graphical User Interface ( GUI )

![Screenshot from 2024-05-05 18-00-08](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/5e74313f-3c7e-4f75-abc1-40f7ac324420)
![Screenshot from 2024-05-05 18-00-15](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/488913a3-b7f6-47ec-b131-16757b6a5d5f)
![Screenshot from 2024-05-05 18-00-45](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/168da2b7-874e-4e23-aef1-977bdd7d7d44)
![Screenshot from 2024-05-05 18-01-12](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/e51567d8-ef94-4c63-b258-a1cd864a2b32)
![Screenshot from 2024-05-05 18-01-19](https://github.com/KarimElAraby/Bash_Script_project/assets/137705973/85494a1d-4e7d-4d27-a844-b5355e8086e2)
