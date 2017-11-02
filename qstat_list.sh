#!/usr/bin/env sh

# Tabulate the jobs running and report how many of each job state there are
# Shows both the job code AND the written out state so it's more clear
qstat_list() {
	# if there are no arguments
	if [ -z '$1' ] 
	then
		args=args=`qstat | grep $USER |  awk '{a = $5 " " a} END {print a}'`
		
	else
		args=`cat test.txt | grep "shadew" | awk '{a = $1 " " a} END {print a}'`
	fi
	# Code to take a list of cluster job codes and turn them into their respective descriptive states
	# In other words, you can actualy understand what the job codes mean!
	code_to_state() {
    	for code in "$@"; do # allows a varying number of args, more flexible
        	case $code in 
            	"qw") echo -e $code "\tPending:user hold" ;; # -e arg allows echo to recognize escaped chars like newlines, tabs, etc
            	"hqw") echo -e $code "\tPending: system hold" ;;
            	"hRwq") echo -e $code "\tPending: user/system hold, re-queue" ;;
            	"r") echo -e $code "\tRunning" ;;
            	"t") echo -e $code "\tTransferring" ;;
            	"Rr") echo -e $code "\tRunning: re-submision" ;;
            	"Rt") echo -e $code "\tTransferring, re-submission" ;;
            	"s" | "ts") echo -e $code "\tJob suspended" ;;
            	"S" | "tS") echo -e $code "\tQueue suspended" ;;
            	"T" | "tT") echo -e $code "\tQueue suspended by alarm" ;;
            	"Rs" | "Rts" | "RS" | "RtS" | "RT" | "RtT") echo -e $code "\tAll suspended with re-submit" ;;
            	"Eqw" | "Ehqw" | "EhRqw") echo -e $code "\tError" ;;
            	"dr" | "dt" | "dRr" | "dRt" | "ds" | "dS" | "dT" | "dRs" | "dRS" | "dRT") echo -e $code "\tDeleted" ;; # regex would be better here
            	*) echo -e $code "\tUnknown job code" ;;
        	esac
    	done
	}

    # date prints the current date, time, etc
    date
    # grep finds match and returns whole line
    # | is the unix pipe. Args before it go into the subsequent command
    # I think its like magrittr::%>%
    # awk breaks each line of input passed to it into fields. 
    # the input in this case would be the values in the different columns outputted
    # by qstat, specifically the job state code.
    # sort sorts the job state codes (ofc), unnecessary tbh
    # uniq -c prints the number of times each line occured
    # along with the lines
    # qstat | grep $USER | awk {'print $5'} | sort | uniq -c # old code
    # awk grabs the 5th argument and strips the newline chars i think?
    #args=`cat test.txt | grep "shadew" | awk '{a = $1 " " a} END {print a}'`
  
    code_to_state $args | sort | uniq -c
}


qstat_list test