#!/bin/bash

clock() {
    echo > clock.output1
    echo > clock.output2

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
        grep $i numbers/three3.txt > clock.output1
        grep $i numbers/two2.txt >> clock.output1
        #cat clock.output | sed -E 's#\n\d# #g' > clock.output
        #sed 's#\n[0-9]# #'
        line=`cat clock.output1 | tr '\n[0-9]'  ' ' `
        line="$line"'\n'
        echo "$line" >> clock.output2
    done

    cat clock.output2

    rm clock.output1
    rm clock.output2
}


clock
