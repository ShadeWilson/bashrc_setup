#!/bin/bash

clock() {
    echo > clock.input
    echo > clock.output

    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

    # kinda a hacky way to grab the digits, but it works
    hour2=`expr $hour % 10`
    hour1=`expr $hour - $hour2 % 100 - 9`

    time2=`expr $time % 10`
    time1=`expr $time - $time2`
    time1=`expr $time1 % 100`
    time1=`expr $time1 / 10`


    echo "Hour: "$hour1$hour2
    echo "Min: "

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
