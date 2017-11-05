#!/bin/sh

clock() {
    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

}