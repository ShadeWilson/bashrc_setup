#!/usr/bin/env sh

#### TODO: grep/awk for url base
# grab port number (store)
open_rstudio() {
	if [ -z "$1" ] 
	then 
		PORT=6095
	else
		 PORT="$1" # find better way to grab default port
	fi
	# c2-6f16-16-2.ihme.washington.edu:6095
	
	#base=`qstat | grep 'RSTUDIO' | awk '{a = $5 " " a} END {print a}'`
	base=`echo "c2-6f16-16-2.ihme.washington.edu"`
	url=""$base":"$PORT""
	echo $PORT
	echo $url
    #start chrome "$url"
    start chrome youtube.com
}

open_rstudio