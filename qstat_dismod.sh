#!/usr/bin/env sh

# command to view unique dismod models
# will put in some options to see job status
qstat_dismod() {
  if [ -z "$1" ] 
	then
		U="$USER"
	# Double quotes must be used around the argument, NOT single quotes
	else
		U="$1"
	fi
  
  # TODO: add option to show and count job status
  # qstat -u $U | grep dm | awk '{print $3 "\t" $5}' | sort | uniq -c
  qstat -u $U | grep dm | awk '{print $3}' | sort | uniq -c
}