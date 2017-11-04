#!/usr/bin/env sh

# Automatically updating qstat so you dont have to type it in over and over
# TODO: add additional args for watch a particular user, other col, 
# change update time frame. Tell you when job is done?

qstat_watch() {
    watch --interval=0.5 qstat
}