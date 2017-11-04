#!/usr/bin/env sh

# This function automatically opens your session
# of RStudio on the cluster that you've already started
# with launch_rstudio. Can import a port number or set a default (recommended)
# based on your chosen port number in launch_rstudio

# TODO: implement choice of browser?
open_rstudio() {
	if [ -z "$1" ] 
	then 
		PORT=6095
	else
		 PORT="$1" # find better way to grab default port
	fi
	
	# need the http:// here or else url wont be read properly
	base=`echo "c2-6f16-16-2.ihme.washington.edu"`
	url="http://"$base":"$PORT"/"
	
	echo "Launching RStudio at "$url"."
    start chrome "$url" 
}

open_rstudio