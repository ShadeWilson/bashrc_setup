#!/usr/bin/env sh

# function to grab the queue url (qrl) from qstat
qrl() {
    PORT=6095
    base=`qstat | grep $USER | grep "rstudio" | awk '{a = $8 " " a} END {print a}' | sed -r 's#(^.*@)|(\s)##g'`
    
    url=""$base"gton.edu:"$PORT""
    
    echo "$url"
}

qurl