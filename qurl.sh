#!/usr/bin/env sh

# function to read qstat and spit out url for RStudio
qurl() {
    PORT=6095
    base=`qstat | grep $USER |  awk '{a = $8 " " a} END {print a}' | sed -r 's#(^.*@)|(\s)##g'`
    
    url=""$base"gton.edu:"$PORT""
    
    echo "$url"
}

qurl