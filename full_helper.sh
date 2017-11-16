#!/bin/bash

# helper method for qstat_full
# takes stripped children file and reorganizes into separate rows
# for each job

full_helper() {

    NUMBERED=`grep "\w" xml_children.txt | cat -n`
    LINES=`echo "$NUMBERED" | wc -l`

    echo $LINES

    for LINE in `seq 1 9 $LINES` # count by 9s, each job has 9 lines
    do
	LAST_LINE=`expr $LINE + 8`
	for (( i=$LINE; i<=$LAST_LINE; i++))
	do
	    echo "$NUMBERED" | grep ' '$i'\t'
	done

	echo $LINE
    done
    
    

}

full_helper