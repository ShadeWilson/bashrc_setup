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

    range=8
    for ((i=0;i<="$range";i++))
    do
        grep $i one.txt >> clock.output
        grep $i two.txt >> clock.output
        echo "for loop"
    done

    cat clock.output
}


clock
