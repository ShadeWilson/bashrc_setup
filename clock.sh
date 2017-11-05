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

    min2=`expr $min % 10`
    min1=`expr $min - $min2`
    min1=`expr $min % 100`
    min1=`expr $min / 10`


    echo "Hour: "$hour1$hour2
    echo "Min: "$min1$min2

    clock[1]="$hour1"; clock[2]="$hour2"; clock[3]="$min1"; clock[4]="$min2"

    find numbers -regex '.*"$hour1".txt'

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
