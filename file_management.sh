#!/bin/bash
# Author: 	Abdul Wahab
# Website: 	Linuxwebhostingsupport.in

# Function to move files or directories
move_file() {
    source_path=$1
    destination_path=$2

    # Check if the source path exists
    if [ ! -e "$source_path" ]; then
        echo "The source path does not exist."
        exit 1
    fi

    # Check if the destination path exists
    if [ -e "$destination_path" ]; then
        echo "The destination path already exists."
        echo "Would you like to overwrite it? (y/n)"
        read OVERRIDE

        if [ "$OVERRIDE" != "y" ]; then
            echo "The operation was cancelled."
            exit 1
        fi
    fi

    mv -v "$source_path" "$destination_path" || {
        echo "Failed to move the file or directory."
        exit 1
    }
    echo "File or directory moved successfully."
}

# Function to copy files or directories
copy_file() {
    source_path=$1
    destination_path=$2

    # Check if the source path exists
    if [ ! -e "$source_path" ]; then
        echo "The source path does not exist."
        exit 1
    fi

    # Check if the destination path exists
    if [ -e "$destination_path" ]; then
        echo "The destination path already exists."
        echo "Would you like to overwrite it? (y/n)"
        read OVERRIDE

        if [ "$OVERRIDE" != "y" ]; then
            echo "The operation was cancelled."
            exit 1
        fi
    fi

    cp -vr "$source_path" "$destination_path" || {
        echo "Failed to copy the file or directory."
        exit 1
    }
    echo "File or directory copied successfully."
}

# Function to delete files or directories
delete_file() {
    path=$1

    # Check if the path exists
    if [ ! -e "$path" ]; then
        echo "The path does not exist."
        exit 1
    fi

    # Check if the path is a directory
    if [ -d "$path" ]; then
        # Delete the directory and all of its contents
        rm -rvf "$path" || {
            echo "Failed to delete the directory."
            exit 1
        }
    else
        # Delete the file
        rm -v "$path" || {
            echo "Failed to delete the file."
            exit 1
        }
    fi
    echo "File or directory deleted successfully."
}

# Function to rename files or directories
rename_file() {
    source_path=$1
    new_name=$2

    # Check if the source path exists
    if [ ! -e "$source_path" ]; then
        echo "The source path does not exist."
        exit 1
    fi

    # Check if the new name is already in use
    if [ -e "$new_name" ]; then
        echo "The new name is already in use."
        echo "Would you like to overwrite it? (y/n)"
        read OVERRIDE

        if [ "$OVERRIDE" != "y" ]; then
            echo "The operation was cancelled."
            exit 1
        fi
    fi

    mv -v "$source_path" "$new_name" || {
        echo "Failed to rename the file or directory."
        exit 1
    }
    echo "File or directory renamed successfully."
}

# Function to create new directories
create_directory() {
    path=$1

    # Check if the path exists
    if [ -e "$path" ]; then
        echo "The path already exists."
        exit 1
    fi

    mkdir -p "$path" || {
        echo "Failed to create the directory."
        exit 1
    }
    echo "Directory created successfully."
}

# Function to list the contents of a directory
list_directory() {
    path=$1

    # Check if the path exists
    if [ ! -e "$path" ]; then
        echo "The path does not exist."
        exit 1
    fi

    ls -l "$path" || {
        echo "Failed to list the contents of the directory."
        exit 1
    }
}

# Main script logic
echo "A simple File Management Script by Linuxwebhostingsupport.in"
echo ""
echo "Warning: Use this script at your own risk. LinuxWebhostingSupport.in shall not be held liable for any loss or damage caused by the use of this script.You must read &understand what this script is doing before running on it your server"
# Options menu
while true; do
    echo ""
    echo "Please select an option:"
    echo "1. Move a file or directory"
    echo "2. Copy a file or directory"
    echo "3. Delete a file or directory"
    echo "4. Rename a file or directory"
    echo "5. Create a new directory"
    echo "6. List the contents of a directory"
    echo "7. Exit"

    read -p "Enter your choice (1-7): " choice

    case $choice in
        1)
            read -p "Enter the full source path: " source
            read -p "Enter the full new destination path: " destination
            move_file "$source" "$destination"
            ;;
        2)
            read -p "Enter the full source path: " source
            read -p "Enter the full new destination path: " destination
            copy_file "$source" "$destination"
            ;;
        3)
            read -p "Enter the path to delete: " path
            delete_file "$path"
            ;;
        4)
            read -p "Enter the source path: " source
            read -p "Enter the new name with full path: " new_name
            rename_file "$source" "$new_name"
            ;;
        5)
            read -p "Enter the full path to create the directory: " path
            create_directory "$path"
            ;;
        6)
            read -p "Enter the full path of the directory to list: " path
            list_directory "$path"
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done
