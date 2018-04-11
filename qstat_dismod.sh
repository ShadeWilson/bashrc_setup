#!/usr/bin/env sh

# COPY FUNCTION BELOW INTO YOUR .bashrc 
# Lists the dismod models you have currently running or in the queue along with a count of jobs
# qstat_dismod -s prints the counts of how many jobs are in each state for each model
qstat_dismod() {
  case "$1" in
            -s) qstat | grep dm | awk '{print $3 "   " $5}'  | sort | uniq -c
            *)  qstat | grep dm | awk '{print $3}' | sort | uniq -c
  esac
}