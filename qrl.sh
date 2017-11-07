#!/usr/bin/env sh

# function to grab the queue url (qrl) from qstat
qrl() {
if [ -z "$1" ] 
    then 
        PORT=6095
    else
         PORT="$1" # find better way to grab default port
    fi

# qstat | grep $USER | grep "rstudio" | awk '{a = $2 " " a} END {print a} --> or whatever job num is
# grab just rstudio line and use to qstat xml
# qstat $JOB -xml | grep "queue_name" | sed -r 's#(.*@)|(<\/.*>)##' --> should be able to output this
    base=`qstat | grep $USER | grep "rstudio" | awk '{a = $8 " " a} END {print a}' | sed -r 's#(^.*@)|(\s)##g'`
    
    url=""$base"gton.edu:"$PORT""
    
    echo "$url"
}

qurl
