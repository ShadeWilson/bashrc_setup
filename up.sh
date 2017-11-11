#!/bin/bash

# function to go up a user-specified amount of directories
function up() {
    if [ -z "$1" ] 
    then 
        GO_UP=1
    else
        GO_UP="$1" # find better way to grab default port
    fi

    NEW_DIR=""

    for i in `seq 1 $GO_UP`;
    do 
	NEW_DIR="$NEW_DIR"'../'
    done

    cd $NEW_DIR
    pwd
}

up 2
