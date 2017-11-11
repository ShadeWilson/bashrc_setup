#!/bin/bash

up() {
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

    echo $NEW_DIR
    cd $NEW_DIR
   # cd $(printf "%0.0s../" $(seq 1 $1));
    
}

up 2
