#!/bin/bash

up() {
    if [ -z "$1" ] 
    then 
        GO_UP=1
    else
        GO_UP="$1" # find better way to grab default port
    fi

    echo $GO_UP
}

up
