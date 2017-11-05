#!/bin/bash

clock() {
    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

    clock[1]="$hour"; clock[2]="$min"

    for i in ${clock[@]}
    do
        echo "$i"
    done

    echo

    for i in {0..8}
    do
        grep $i one.txt
    done
}
clock
