#!/bin/bash

# function to go up a user-specified amount of directories
# input number of directories you want to do up 
# if you choose too high a number, it just puts you at the highest dir

# needs to be in a .bashrc/.bash_profile file to work.
# doesnt work as a shell script.
function up() {
    if [ -z "$1" ] 
    then 
        GO_UP=1 # default go up one
    else
        GO_UP="$1" 
    fi

    NEW_DIR=""

    for i in `seq 1 $GO_UP`;
    do 
	NEW_DIR="$NEW_DIR"'../'
    done

    cd $NEW_DIR
    pwd # print final directory
}

up 2
