#!/usr/bin/env sh

#### TODO: grep/awk for url base
# grab port number (store)
open_rstudio() {
	PORT=6009 # find better way to grab default port
	#base=`qstat | grep 'RSTUDIO' | awk '{a = $5 " " a} END {print a}'`
	base=`echo "www.google.com"`
	url=""$base":"$PORT""

    start chrome "$url"
}

open_rstudio