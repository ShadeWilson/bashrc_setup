#!/bin/bash

clock() {
    echo > clock.input
    echo > clock.output

    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

    clock[1]="$hour"; clock[2]="$min"

    find numbers -regex '.*3.txt'

    for i in ${clock[@]}
    do
        echo "$i"
    done

    echo

    range=8
    for ((i=0;i<="$range";i++))
    do
        grep $i numbers/one1.txt > clock.input
        grep $i numbers/two2.txt >> clock.input
        grep $i numbers/colon.txt >> clock.input
        grep $i numbers/three3.txt >> clock.input
        grep $i numbers/four4.txt >> clock.input

        line=`cat clock.input | tr '\n[0-9]'  ' ' `
        line="$line"'\n'
        echo "$line" >> clock.output
    done

    cat clock.output

    rm clock.input
    rm clock.output
}


clock
