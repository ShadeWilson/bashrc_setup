#!/usr/bin/env sh

# function to grab the queue url (qrl) from qstat
qrl() {
if [ -z "$1" ] 
    then 
        PORT=6009
    else
         PORT="$1" # find better way to grab default port
    fi

    # grab job number
    # use job number to find exec_host_list aka queue name and take info we want
    JOB_NUM=`qstat | grep $USER | grep "rstudio" | awk '{a = $1 " " a} END {print a}'`
    base=`qstat -j $JOB_NUM | grep "exec_host_list" | sed -r 's#(.*1:\s*)|(:2\s*)##g'`

    url=""$base":"$PORT""
    
    echo "$url"
}

qurl

###### Fun Functions #######