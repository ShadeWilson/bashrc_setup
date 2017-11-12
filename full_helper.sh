#!/bin/bash

# helper method for qstat_full
# takes stripped children file and reorganizes into separate rows
# for each job

full_helper() {

    NUMBERED=`grep "\w" xml_children.txt | cat -n`
    LINES=`cat xml_children.txt | wc -l`

    echo $LINES
    
    

}

full_helper