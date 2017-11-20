# Setting Up Your .bashrc
Helpful bash functions that can be pasted into a .bashrc file or run directly on the command line so you can work more efficiently on the cluster and beyond. These functions are annotated to be understandable for newcomers. Users can customize files to fit their own research needs or delete all comments, run the functions, and not worry about the details.

**Note:** this repo is currently under development, so not everything is in its final state! Please keep this in mind.

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

[Here's a fairly comprehensive list of bash commands compiled by UW.](https://courses.cs.washington.edu/courses/cse390a/15wi/bash.html)

## Aliases

## Functions built for the cluster

## General efficiency functions

## Just for fun(ctions)

## Advanced bash commands

## Resources for more information

TBD

http://www.grymoire.com/Unix/Sed.html#uh-1

http://www.thegeekstuff.com/2012/12/linux-tr-command

https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php

http://gridscheduler.sourceforge.net/htmlman/htmlman1/qstat.html

http://web.mit.edu/longjobs/www/status.html

https://regex101.com/

http://www.linfo.org/watch.html

http://www.tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html#chap_01
