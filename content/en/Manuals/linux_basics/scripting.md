---
title: Scripting
linkTitle: Scripting
type: docs
weight: 10
aliases:
    - /manuals_linux-basics_scripting.html
    - /manuals_linux-basics_scripting
---

## Scripting

Converting code into a script is useful, and almost necessary when running jobs on the cluster.

There are many benifits of doing this:

* Easy to run - blackbox
* Easy to maintain - consolidated code
* Easy to distribute - capsulated code
* Easy to automate (crontab?) - does not require interaction

### Breakdown

There are four basic parts that are needed to convert your commands into a script:

1. First save all your commands into a file and call it `myscript.sh`, you can do this with a [Text Editor](/manuals/linux_basics/text/) or [Transferring](/manuals/linux_basics/filesystems/) it from your computer.

2. Add the `#!` (SheBang) as the first line in file, this defines the interpreter. In this example, we are using `bash` as the interpreter, which will run all subsequent lines in this file:

```
#!/bin/bash
```

3. Add the proper permissions to the script, allow user (or group) execution:

```
chmod u+x myscript.sh
```

OR

```
chmod g+x myscript.sh
```

4. You can pass arguments via command line into a script, this step is optional, but important to note.

For example if I want to call my script, like so:
```
/where/my/script/lives/myscript.sh username number
```

Then inside my script I can capture the command line arguments into variables, like this:
```
username=$1
number=$2
```

5. Lastly adding the path to a script to the `PATH` environment variable, allows us to call the script without a prefixed path:

```
export PATH=/where/my/script/lives/:$PATH     # Can be added to .bashrc for convenience
```

After we have exported `PATH` with the new path of our script, we call it like so:

```
myscript.sh username number
```

### Walkthrough

My bash commands:
```
sacct -n -p -u jhayes -S 2020-01-01 -l > myjobs.txt
cut -d'|' -f4 myjobs.txt > partitions.txt
wc -l partitions.txt > count.txt
```

Convert the above commands into a script named `myscript.sh`, with the following contents:

```
#!/bin/bash

# Gather Slurm job information
sacct -n -p -u jhayes -S 2020-01-01 -l > myjobs.txt

# Filter on parittion column
cut -d'|' -f4 myjobs.txt > partitions.txt

# Count how many records per partition
cat partitions.txt | sort | uniq -c > count.txt
```

Optional, we can alter the above commands by adding some pipes, as well as adding some variables to make this script count records for only a given partition:

```
#!/bin/bash -l

# Gather Slurm job information
#  filter on partition column
#  count how many records for given partition
sacct -n -p -u $1 -S 2020-01-01 -l | cut -d'|' -f4 | grep $2 | wc -l > count.txt
```

Add correct permissions:

```
chmod u+x myscript.sh
```

Add to my `PATH`:

```
mkdir -p ~/bin
mv myscript.sh ~/bin
export PATH=~/bin:$PATH
```

Now run my new script:

```
myscript.sh
```

Or, if we did the optional step of adding variables, we can do this:

```
myscript.sh johndoe001 intel         # Arguments are <USERNAME> and <PARTITION>
```
