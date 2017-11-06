#!/bin/bash

clock() {
    echo > clock.input
    echo > clock.output

    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

    # kinda a hacky way to grab the digits, but it works
    hour2=`expr $hour % 10`
    hour1=`expr $hour - $hour2`
    hour1=`expr $hour1 % 100`
    hour1=`expr $hour1 / 10`

    min2=`expr $min % 10`
    min1=`expr $min - $min2`
    min1=`expr $min % 100`
    min1=`expr $min / 10`

    #echo "Hour: "$hour1$hour2
    #echo "Min: "$min1$min2

    clock[1]="$hour1"; clock[2]="$hour2"; clock[3]="$min1"; clock[4]="$min2"

    inc=0 # dont forget this is a string!
    for i in ${clock[@]}
    do
        #ls numbers/*"$i".txt
        file[$inc]=`ls numbers/*"$i".txt`
        inc=`expr $inc + 1`
    done


    range=8

    for ((i=0;i<="$range";i++))
    do
        grep $i ${file[0]} > clock.input
        grep $i ${file[1]} >> clock.input

        grep $i numbers/colon.txt >> clock.input

        grep $i ${file[2]} >> clock.input
        grep $i ${file[3]} >> clock.input

        line=`cat clock.input | tr '\n[0-9]'  ' ' `
        line="$line"'\n'
        echo "$line" >> clock.output
    done

    cat clock.output

    rm clock.input
    rm clock.output

}


clock
