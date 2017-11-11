#!/usr/bin/env sh

qstat_full() {
    if [ -z "$1" ]; then U=$USER; else U=$1; fi;
    # tr = translate. In this case it replaces each '\n' with ' '
    # sed is very complicated. Is it really the right choice here?
    # '#' seems to be used here as the delimiter. Unconventional. May be because _ is in regex string
    # This means that the reg ex matching string (first) is separated from the replacement string (second) by a '#'
    # ex: in the first sed, the regex is '<job_list[^>]*>' and the replacement string is '\n' (inserting a newline)
    # first regex expression matches exactly <job_list> and replaces with \n
    # now we have ex: qw</job_code> on a line by itself
    # 'g' at end of expression means the replacement is applied to ALL matches, not just first
    # I think we want this because we may have multiple jobs running
    # The second regex matches all <headings> and </headings> (endings, idk proper term) at replaces with '' (deletes)
    # now we are left with all the info for a job separated by a newline (I think) and each job itself separated by a newline

    # this regex is absolutely gross but it works. Could split it up but it probs still wont be readable
    # sed -r 's#(^,*)|(,*$)##g' removes all extra commas (,) in the beginning and end
    # sed -r 's#,{2,}#,#g' replaces all places with mutiple commas with just 1
    # -r is needed in all these cases
    # maybe can fix issue with insert \n at end of each job description

		######## GRAVE YARD #########
		#cat xml.txt | sed -r 's#(<[^>"]*>)|(<job_info[^>]*>)|(<job_list[^"]*)|(">?)|(\s)##g' | tr '\n' '~' | sed -r 's#(^~*)|(~*$)##g' | sed -r 's#~{2,}#~#g' | column -t >> qstat_full.output

		####### ACTUAL CODE #######
    # set column names and save them first to file
    echo 'State~Job Number~JAT prio~Name~Owner~Job Code~Start Time~Queue Name~Slots' > qstat_full.output

		xml=`qstat -u "$U" -xml` # save xml output
		children=`echo "$xml" | sed -r 's#(<[^>"]*>)|(<job_info[^>]*>)|(<job_list[^"]*)|(">?)|(\s)##g'` # grab the children, drop decriptions
		out=`echo "$children"` # this gets rid of all extra newlines!!
		echo "$out" > full_details.txt
		cat full_details.txt

    #out=`qstat -u "$U" -xml | sed -r 's#(<[^>"]*>)|(<job_info[^>]*>)|(<job_list[^"]*)|(">?)|(\s)##g' | tr '\n' '~' | sed -r 's#(^~*)|(~*$)##g' | sed -r 's#~{2,}#~#g'`
		#echo "$out" #>> qstat_full.output

		# qstat -xml | tr '\n' ' ' | sed 's#<job_list[^>]*>#\n#g'  | sed 's#<[^>]*>##g' | grep " " | column -t
    #cat qstat_full.output

    column -s"~" -t qstat_full.output
    rm qstat_full.output
		rm full_details.txt
}

# call function
qstat_full
