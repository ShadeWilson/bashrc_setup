# Setting Up Your .bashrc
Helpful bash functions that can be pasted into a .bashrc file or run directly on the command line so you can work more efficiently on the cluster and beyond. These functions are annotated to be understandable for newcomers. Users can customize files to fit their own research needs or delete all comments, run the functions, and not worry about the details.

**Note:** this repo is currently under development, so not everything is in its final state! Please keep this in mind.

## Table of contents

* [What is a .bashrc?](https://github.com/ShadeWilson/bashrc_setup#what-is-a-bashrc)

* [What is bash?](https://github.com/ShadeWilson/bashrc_setup#what-is-bash)

* [Basic bash commands](https://github.com/ShadeWilson/bashrc_setup#basic-bash-commands)

* [Aliases](https://github.com/ShadeWilson/bashrc_setup#aliases)

* [Functions built for the cluster](https://github.com/ShadeWilson/bashrc_setup#functions-built-for-the-cluster)

* [General efficiency functions](https://github.com/ShadeWilson/bashrc_setup#general-efficiency-functions)

* [Just for fun(ctions)](https://github.com/ShadeWilson/bashrc_setup#just-for-functions)

* [Advanced bash commands](https://github.com/ShadeWilson/bashrc_setup#advanced-bash-commands)

* [Resources for more informations](https://github.com/ShadeWilson/bashrc_setup#resources-for-more-information)

## What is a .bashrc?
A `.bashrc` file is basically a configuration file that sets up your environment when you open up a terminal window. It is a special kind of shell script typically found in your home directory that's run at the beginning of a session. You can also run it by typing `source .bashrc` in your home directory. You can put pretty much whatever you want into your .bashrc. It's a great place to customize the look of your command prompt (the bit before where your commands go. ex: `shadew $`), add in aliases, or "nicknames", for commands you often type, or write functions you can call no matter what directory you're in.

### Why should I care?
Making good use of your `.bashrc` can save you a lot of time and frustration! Mistype commands a lot? You can make an alias so that the computer still understands you even when you give it a garbled mess. Tired of typing `cd this/file/path/is/way/too/long`? Save time by giving your long-distance directory a pet name. You can even write your own function you can call anywhere, just like the base bash functions.

There's an almost unlimited number of ways your can customize you `.bashrc` for your own needs. 

### .bashrc vs. .bash_profile
The `.bash_profile` file is a companion script to `.bashrc`. Most `.bash_profile`s default to sourcing the available `.bashrc`. Why is this?

To allow for more advanced uses, `.bashrc` is run for interactive shells (when a new terminal window is opened) while `.bash_profile` is executed for login shells (where you have to input your username and password). This way, if you want to see more advanced diagnostics about jobs your running whenever you login, but *not* every time you open a new window, you would put that stuff in your `.bash_profile`.

Since having multiple configuration files can get messy, the default usually to write your custom settings in your `.bashrc` and source it in your `.bash_profile` like so:

```bash
# This is my .bash_profile
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
```

Note that Mac's version of the terminal runs a login shell by default and thus calls `.bash_profile` whenever you open a new window. If you use a Mac, it makes more sense to put everything in your `.bash_profile` instead.

[More information about the difference between the two.](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html)

## What is bash?

"Bash" is an acronym which stands for *Bourne-again shell*, a joke on the Bourne shell it replaces. First released in 1989, the language is widely used for most Linux distributions and on Apple's macOS. Note that it is a separate language than the shell language used for Windows, PowerShell. Bash is typically run in a text window where the user types a command to interact with files, folder, and other objects on the desktop. It can also be used to execute commands from a file called a shell script, which is essentially what a `.bashrc` is.

For more details [see the wikipedia page](https://en.wikipedia.org/wiki/Bash_(Unix_shell)).

## Basic bash commands

Navigating in a linux enviroment can be terrifying for newcomers since it's vastly different from a point-and-click interface. Here are some useful bash commands to get you more comfortable working in the terminal.

**Common bash commands**

These commands are all you need to get started working on the command line.

| Command | Description | Examples and options
| ------- | ----------- | -------
| ls | **l**i**s**t files in a directory | -`ls -a` shows otherwise hidden files (like .bashrc)<br>-`ls --color=auto` enables coloring content based on type (file, directory, link, etc.)<br>-`ls -lrt` shows **l**ong format by **t**ime of last modification in **r**everse order
| cd | **c**hange working **d**irectory. Can be an absolute or relative path | `-cd` changes directory to your home directory<br>-`cd ..`moves you backwards one directory
| pwd | **p**rint **w**orking **d**irectory. This will give you the absolute path | -`pwd`
| mkdir | **m**a**k**e a new **dir**ectory in the working directory | -`mkdir new_dir`
| cp | **c**o**p**y a file under a new name or different directory | -`cp old_file new_file`<br>-`cp old_file_in_current_dir other_dir`
| mv | **m**o**v**e a file or directory. Can also be used to rename | -`mv old_file_name new_file_name`<br>-`mv file other_dir/file`
| rm | **r**e**m**ove a file or directory although you'll need additional options for the latter | -`rm outdated_file`<br>-`rm -r outdated_dir`
| man | displays a **man**ual page for a command. Not particularly useful unless you already know what you're looking for, but it's there if you need it. Press q to close | -`man cd`

**File manipulation**

| Command | Description | Examples and options
| ------- | ----------- | -------
| cat | displays the contents of a file. Can also be used for file con**cat**enation and file creation. [More information](http://www.linfo.org/cat.html) | -`cat file1` displays the contents of file1<br>-`cat file1 file 2 > file3` concatenates file1 and file2 into file3, overwriting anything file3<br>-`cat file1 >> file2` adds the contents file1 to the end of file2 without overwriting
| head, tail | output the beginning, end of a file | -`head -n file` shows the first n lines
| wc | **w**ord **c**ount; prints number of lines, words and bytes in a file | `wc file`

[Here's a fairly comprehensive list of bash commands compiled by UW.](https://courses.cs.washington.edu/courses/cse390a/15wi/bash.html)

## Aliases

Aliases are basically nicknames you can give to commands. They're usually used for commands you type repeatly, very long commands you can't remember, or commands you mistype a lot, but you can make an alias out of pretty much anything. Some examples:

```bash
alias lh='ls -lhaG' # adds color and additional detail to ls outputs; I don't have to remember the details
alias pdw='pwd'     # save yourself the annoyance if you mistype this often

alias go='cd /long/file/path/I/cant/remember/and/dont/want/to/have/to/type/every/time'

alias gs='git status' # shortcuts for git commands I used repeatedly
alias ga='git add'
alias gc='git commit'
alias gp='git push'
```

## Functions built for the cluster

A lot of work at IHME revolves aroud launching, monitoring, and relaunching jobs on the cluster. Building in custom functions into your `.bashrc` to make what you do on a daily basis easier. Here are some examples. Fell free to copy and paste them into your `.bashrc` if they seem useful to you!

Toggle on/off full job names. SGE defaults to truncating job names after a certain number of characters. Command: `toggle`

```bash
toggle() {
	if [ $SGE_LONG_JOB_NAMES -eq 1 ] 
	then 
		export SGE_LONG_JOB_NAMES=-1
		echo "Full job names toggled on."
	else
		export SGE_LONG_JOB_NAMES=1
		echo "Full job names toggled off."
	fi
}
```

List the number of jobs scheduled in each state. Ex if you have 3 jobs running and 200 waiting for slots in the queue, `qstat_list` would return:

```
3 r Runing
200 qw Pending: user (slots) hold
```


```bash
# Tabulate the jobs running and report how many of each job state there are
# Shows both the job code AND the written out state so it's more clear
qstat_list() {
		if [ -z '$1' ] 
		then
			args=`qstat | grep $USER |  awk '{a = $5 " " a} END {print a}'`
		else
			U='$1'
			args=`qstat -u $U| grep $U |  awk '{a = $5 " " a} END {print a}'`
		fi
		
    args=`qstat | grep $USER |  awk '{a = $5 " " a} END {print a}'`
    code_to_state $args | sort | uniq -c
}

# Code to take a list of cluster job codes and turn them into their respective descriptive states
# In other words, you can actualy understand what the job codes mean!
code_to_state() {
    for code in "$@"; do # allows a varying number of args, more flexible
        case $code in
            "qw") echo -e $code "\tPending: user (slots) hold" ;; # -e arg allows echo to recognize escaped chars like newlines, tabs, etc
            "hqw") echo -e $code "\tPending: system (job) hold" ;;
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
```

Very useful function to delete ALL jobs whose job names match whatever string you pass in. Ex: `qdeln calc` will delete all jobs with "calc" in their name.

```bash
qdeln() {
    qstat | grep $1 | awk {'print $1'} | xargs qdel
}
```

Delete jobs based on the state they are in. Ex: `qdel_state r` will delete all jobs running

```bash
qdel_state() {
	qstat -s $1 | awk {'print $1'} | tail -n +3 | xargs qdel
}
```

Continuously monitor jobs, updating every minute. Note: it's better to wait 60 than repeatly called qstat as that can make the job scheduler very angry. Ex: `qstat_watch`

```bash
qstat_watch() {
  watch -n 60 'qstat; beep; echo; echo "To exit, press ^C (control-C)."'
}
```


## General efficiency functions

Here are some examples of functions that help with general efficiency navigating aroud the command line.

Go up a user-specified amount of directories input number of directories you want to do up if you choose too high a number, it just puts you at the highest dir. Ex: `up 3` will take you up three directories.

```bash
up() {
    if [ -z "$1" ]
    then
        GO_UP=1 # default go up one
    else
        GO_UP="$1"
    fi

    NEW_DIR=""

    for i in `seq 1 $GO_UP`;
    do
	NEW_DIR="$NEW_DIR"'../'
    done

    cd $NEW_DIR
    pwd # print final directory
}
```

More functions incoming. [Suggest one here!](https://github.com/ShadeWilson/bashrc_setup/issues)

## Just for fun(ctions)

Force your computer to greet you every day! This function prints out today's date and a greeting based on the day. You can edit the greetings however you wish to customize them. To be greeted every time you open a new terminal window, you'll need to put this function AND a call for this function (`greetings`) in your `.bashrc`.

```bash
greetings() {
    date "+%B %d, %Y"
    echo

    DAY=`date "+%A"`

    case $DAY in
        "Sunday") echo "Happy Sunday! Enjoy the rest of your weekend!" ;;
        "Monday") echo "I know it's Monday, but you got this!" ;;
		"Tuesday") echo "Happy Taco Tuesday!" ;;
		"Wednesday") echo "HUMP DAAAAAAAAAAAAY!" ;;
		"Thursday") echo "One more day until the weekend, hang in there!" ;;
		"Friday") echo "Happy Friday!!" ;;
		"Saturday") echo "... :)" ;;
    esac
}

greetings
```

Makes a noise! Requires your sound to be on to hear it, and oyu may also need to be on a Windows. I put a call of this function in my `.bashrc` so that it makes a noise when my login goes through. Useful if your login lags/takes a long time and you want to do other things in the meantime.

```bash
beep() {
	echo -en "\007"
}

beep
```

Prints the current time in Big Money - SW ASCII art font (credit to patorjk.com). You'll have to download the `numbers` folder from this repo. The easiest way to do this is to clone the repo into your home (`~`) directory.


```bash
clock() {
    # create temp files
    echo > clock.input
    echo > clock.output

    # read in hour and minute values
    time=`date "+%I %M"`
    hour=`echo "$time" | awk '{a = $1 " " a} END {print a}'`
    min=`echo "$time" | awk '{a = $2 " " a} END {print a}'`

    # kinda a hacky way to grab the digits, but it works
    # expr is needed for bash to treat the strings as ints
    # Remember: all vars in bash are really strings!
    hour2=`expr $hour % 10`
    hour1=`expr $hour - $hour2`
    hour1=`expr $hour1 % 100`
    hour1=`expr $hour1 / 10`

    min2=`expr $min % 10`
    min1=`expr $min - $min2`
    min1=`expr $min % 100`
    min1=`expr $min / 10`

    #echo "Hour: "$hour1$hour2
    #echo "Min: "$min1$min2

    # Save the 4 digits (HH:MM) into an array for easier iteration
    clock[1]="$hour1"; clock[2]="$hour2"; clock[3]="$min1"; clock[4]="$min2"

    inc=0 # dont forget this is a string!
    for i in ${clock[@]}
    do
        #ls numbers/*"$i".txt
        # grab the file in the number folder
        # all are labeled generally: ex - numbers/one1.txt
        file[$inc]=`ls $J_ROOT/temp/shadew/numbers/*"$i".txt`
        inc=`expr $inc + 1`
    done

    # Nine (starting from 0) lines for this font
    range=8

    for ((i=0;i<="$range";i++))
    do
        # Grab the correct line number, save all four + colon to a temp file
        grep $i ${file[0]} > clock.input
        grep $i ${file[1]} >> clock.input

        grep $i $HOME/bashrc_setup/numbers/colon.txt >> clock.input

        grep $i ${file[2]} >> clock.input
        grep $i ${file[3]} >> clock.input

        # Remove the line numbers and all newline chars
        line=`cat clock.input | tr '\n[0-9]'  ' ' `
        # Add a single newline to the end of the line
        echo "$line" >> clock.output # add to end of output
    done

    cat clock.output

    # Remove temp files
    rm clock.input
    rm clock.output

}

clock
```




## Advanced bash commands

## Resources for more information

Here are some helpful and more detailed links about various things bash/commandline-related.


### General info on bash as a language

[Machtelt Garrels' Bash Beginner's Guide](http://www.tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html#chap_01)

[If statements in bash](https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php)

### Working with the Sun Grid Engine (SGE)

[The Sun Grid Engine (SGE) man page on qstat](http://gridscheduler.sourceforge.net/htmlman/htmlman1/qstat.html)

[Checking SGE job status](http://web.mit.edu/longjobs/www/status.html)

### Closer looks at bash functions

[All about `tr` (translate)](http://www.thegeekstuff.com/2012/12/linux-tr-command)

[The definitive guide on `sed`.](http://www.grymoire.com/Unix/Sed.html#uh-1)

[Detailed info on `watch`](http://www.linfo.org/watch.html)

### Misc

[Regex 101: a regular expressions playground](https://regex101.com/)