---  
title: "Linux basics"  
author: Melody Asghari  
date: December 18, 2020  
output:  
  ioslides_presentation:  
    keep_md: yes  
    widescreen: yes  
    df_print: paged  
    smaller: true  
subtitle: "Login and Basic Commands"
---

## Summary

- Accessing the cluster
  - with Mac OS X
  - with Windows
    - from anywhere!
- Glossary of Common Terms
- Basic commands in linux 
  - Starting from where you are (Square One)
  - Manipulating Files/Directories
  - Moving Files and Directories
  - Helpful Utilities
  - Utilities Cont.

## Mac - OS X Users

Type the `command` + `space` bar key on the keyboard to pull up the "Spotlight Search" bar

![key presses highlighted](images/1.png)

Or press the following highlighted magnifying glass icon in the top right of the screen:

![Spotlight icon](images/2.png)

## Mac - OS X Users Cont. 

The search bar will pop up in the middle of the screen:

![Spotlight Search bar](images/3.png)

Type "terminal" to search for and highlight the terminal app, then press the `enter` key.

![Terminal Selected](images/4.png)

## Windows Users

1. After [downloading](https://mobaxterm.mobatek.net/download-home-edition.html) and installing MobaXterm, start the program by clicking on the "MobaXterm_Personal.exe" file.

2. Click on "Start local terminal"

![Screen Shot 2020-12-15 at 15.53.54.png](images/5.png)

## Logging in (any operating System)

You can log in anywhere! Using the helpful protocol: ssh.  SSH is a. Secure SHell program that lets us access a Linux computer across the internet while encrypting the data sent and received.

 Whether you're using Windows or OS X (Mac) you'll inevitably reach the same step once the terminal is open:

`ssh -X YourUsername@cluster.hpcc.ucr.edu`

## Glossary of Common Terms

Before we start, we should go over some common vocabulary we use and you should become familiar with. However, for the purpose of this presentation, I will try to make this as easy to understand as possible.  

- **(binary) executable**: another way of referring to a program that has been compiled so it can be used day to day. Windows users might notice their programs end with .exe
- **command**: input we're going to type in the shell to perform a specific task
- **directory**: areas on a hard disk in which files can be stored/organized aka a Folder
- **Path:** environment variable in linux that tells the shell which directories to search for ready-to-run programs (executables).
- **shell**: within our circle, a program that lets you control the system using commands via your keyboard. Bash, Zsh are shells.
- **variable**: a changeable value that stores a certain data type, remembering it for future reference by the system, these are vital to the linux kernal.
  - **environment variable**: a user will have unique configurations, such as variables that tell the shell where the programs are located

## Basic Commands: Square One 

**P**rint **W**orking **D**irectory

- `pwd` → returns the location (path) of where you have ended up currently

**L**i**s**(ting the contents of the current directory)

- `ls -a` → **l**i**s**t **a**ll files
- `ls -l` → **l**ist with **l**onger details
- `ls -a` + `ls -l` = **`ls -la`** → **l**i**s**t **a**ll files with **l**onger details

## Basic Commands: Square One Cont.

**C**hange **D**irectory

- `cd` → **c**hanges your current location to your home **d**irectory
- `cd ..` → **c**hanges **d**irectory to the one above
- `cd ../../` → **c**hanges **d**irectory to two folders above

## Basic Commands: Manipulating Files/Folders

**M**a**k**e a new **Dir**ectory

- `mkdir my_directory` → makes a new folder called *my_directory* located in your curmkrent location

Create a new file (**touch** your fingers on the keyboard)

- `touch file` → creates an empty file named *file*
- `touch file.txt` → creates an empty file named *file* with the *txt* extension
- `touch PowerAt.Your.FingerTips` creates a file named *PowerAt.Your* with the *FingerTips* extensions

## Basic Commands: Manipulating Files/Folders Cont. 

**R**e**m**ove (a file)

- `rm filename` → removes *filename* from where you are currently in the directory

**R**e**m**ove an empty **Dir**ectory (no files/sub-directories)

- `rmdir directory_name/` → removes *directory_name/* from where you currently are

Display **C**ontents (of **a** file **t**o the screen)p

- `cat filename` → outputs the content of the file
- `cat -n filename` → outputs the content of the file with line numbers

## Basic Commands: Moving Files/Folders

**C**o**p**y (file OR directory to somewhere else ) 

- `cp file_source/file.txt destination/` → copies the file named *file.txt* in the *file_source/* folder to the *destination/* folder
- `cp -r directory_source/ destination/` → copies the folder *directory_source/* recursively to the *destination/*
- `cp file_source file_backup` → renames the *file_source* to *file_backup* in the same directory

**M**o**v**e (file or directory to somewhere else)

- `mv old_file_name new_file_name` → renames the file *old_file_name* to *new_file_name*
- `mv file_name path/` → moves *file_name* to the folder *path/*

## Basic Commands: Helpful Utilities

**Man**ual

- `man ls` → displays the linux manual page for the `ls` command
- `man -k HELP` → searches the linux manual page titles and synopses for the word *HELP*

**Find** my file in this folder or file

- `find . -name '*.txt'` → find any files in my current directory with the ".txt" extension in the name of the file
- `find . -name 'my_file_name'` → find any files in my current directory with the "my_file_name" name
- `find some/folder/ -name "*.json"` → find any files with any name with the ".json" extension in the some/folder/ path

## Basic Commands: Helpful Utilities Cont.

**W**ord **C**ount (or lines/characters)

- `wc file.txt` → word/line/character count of the supplied file.txt
- `wc -w file.txt` → word count of the supplied file.txt
- `wc -l file.txt` → line count of the supplied file.txt
- `wc -c file.txt` → character count of the supplied file.txt

**P**rocesse**s** 

- `ps` → your processes!
- `ps aux` → displays processes of all users with all the background processes started at boot time

## Basic Commands: Other Utilities

**Which** is the correct location of my program (that is executed when you type its name in the terminal) ?

- `which python` → returns the location (path) of the program

**G**lobal **R**egular **E**xpression **P**rint - Search for a file for lines with your criteria  using regular expressions, a powerful/complex method of describing your search material with a string that can use various symbols to indicate patterns

- `grep your_search_pattern file_name` 
- `grep "hello" /path/file` → searches the word *hello* in the file named *file* within the location

## Basic Commands: Other Utilities Cont.

**less**, or more but backwards

- `less file.txt` → reads the file but with pagination 

A helpful graphical table of frequently used commands ([on Wikipedia](https://en.wikipedia.org/wiki/Less_(Unix)#Usage))

**echo**

- `echo "hello"` → returns the word *hello* 
- `echo $?` → returns the exit code of the last command
- `echo $PATH` → returns the current executable variables within your path (programs you can run)

