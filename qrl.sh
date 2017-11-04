#!/usr/bin/env sh

# function to grab the queue url (qrl) from qstat
qrl() {
if [ -z "$1" ] 
    then 
        PORT=6095
    else
         PORT="$1" # find better way to grab default port
    fi

    base=`qstat | grep $USER | grep "rstudio" | awk '{a = $8 " " a} END {print a}' | sed -r 's#(^.*@)|(\s)##g'`
    
    url=""$base"gton.edu:"$PORT""
    
    echo "$url"
}

qurl