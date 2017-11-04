#!/usr/bin/env sh

# grab the queue url (qrl) from qstat
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
# This function automatically opens your session
# of RStudio on the cluster that you've already started
# with launch_rstudio. Can import a port number or set a default (recommended)
# based on your chosen port number in launch_rstudio

# TODO: implement choice of browser?
open_rstudio() {
    # need the http:// here or else url wont be read properly
    qrl=`qrl`
    #url="http://"$base":"$PORT"/"
    full_url="http://"$qrl"/"

    echo "Launching RStudio at "$full_url"."
    start "/homes/shadew/chrome.exe" "$full_url"
    # start chrome "$url"
}

open_rstudio