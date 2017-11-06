#!/bin/bash

# Author: Shade Wilson
# This function prints the current time (according to date)
# in Big Money - SW ASCII art font (credit to patorjk.com).
# It reads in separate files containing the number needed where
# the beginning of each line has a line number (0 - 8). The function
# iterates through each file and grabs one line at a time,
# deletes the line numbers and adds a newline to the end.
clock() {
    # create temp files
    echo > clock.input
    echo > clock.output

    # read in hour and minute values
    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

    # kinda a hacky way to grab the digits, but it works
    # expr is needed for bash to treat the strings as ints
    # Remember: all vars in bash are really strings!
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

    # Save the 4 digits (HH:MM) into an array for easier iteration
    clock[1]="$hour1"; clock[2]="$hour2"; clock[3]="$min1"; clock[4]="$min2"

    inc=0 # dont forget this is a string!
    for i in ${clock[@]}
    do
        #ls numbers/*"$i".txt
        # grab the file in the number folder
        # all are labeled generally: ex - numbers/one1.txt
        file[$inc]=`ls numbers/*"$i".txt`
        inc=`expr $inc + 1`
    done

    # Nine (starting from 0) lines for this font
    range=8

    for ((i=0;i<="$range";i++))
    do
        # Grab the correct line number, save all four + colon to a temp file
        grep $i ${file[0]} > clock.input
        grep $i ${file[1]} >> clock.input

        grep $i numbers/colon.txt >> clock.input

        grep $i ${file[2]} >> clock.input
        grep $i ${file[3]} >> clock.input

        # Remove the line numbers and all newline chars
        line=`cat clock.input | tr '\n[0-9]'  ' ' `
        # Add a single newline to the end of the line
        echo "$line" >> clock.output # add to end of output
    done

    cat clock.output

    # Remove temp files
    rm clock.input
    rm clock.output

}


clock
