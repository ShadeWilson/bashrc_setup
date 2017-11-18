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

Note that for Mac's version of the terminal runs a login shell by default and thus calls `.bash_profile` whenever you open a new window.

[More information about the difference between the two.](http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html)

## What is bash?

## Basic bash commands
https://courses.cs.washington.edu/courses/cse390a/15wi/bash.html

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
