---
type: docs
linkTitle: Shell Bootcamp
title: Shell Bootcamp
permalink: manuals_linux-basics_shell.html
---


## The Unix Shell
When you log into UNIX/LINUX system, then is starts a program called the Shell. It provides you with a working environment and interface to the operating system. Usually there are several different shell programs installed. The shell program bash is one of the most common ones.

```bash
finger <user_name> # shows which shell you are using
chsh -l # gives list of shell programs available on your system (does not work on all UNIX variants)
<shell_name> # switches to different shell
```

### STDIN, STDOUT, STDERR, Redirections, and Wildcards

See [LINUX HOWTOs](http://www.tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-3.html)


By default, UNIX commands read from standard input (STDIN) and send their output to standard out (STDOUT).

You can redirect them by using the following commands:

```bash
<beginning-of-filename>*         # * is wildcard to specify many files
ls > file                        # prints ls output into specified file
command < my_file                # uses file after '<' as STDIN
command >> my_file               # appends output of one command to file
command | tee my_file            # writes STDOUT to file and prints it to screen
command > my_file; cat my_file   # writes STDOUT to file and prints it to screen
command > /dev/null              # turns off progress info of applications by redirecting
                                 # their output to /dev/null
grep my_pattern my_file | wc     # Pipes (|) output of 'grep' into 'wc'
grep my_pattern my_non_existing_file 2 > my_stderr # prints STDERR to file
```

### Useful shell commands

```bash
cat <file1> <file2> > <cat.out>      # concatenate files in output file 'cat.out'
paste <file1> <file2> > <paste.out>  # merges lines of files and separates them by tabs (useful for tables)
cmp <file1> <file2>                  # tells you whether two files are identical
diff <fileA> <fileB>                 # finds differences between two files
head -<number> <file>                # prints first lines of a file
tail -<number> <file>                # prints last lines of a file
split -l <number> <file>             # splits lines of file into many smaller ones
csplit -f out fasta_batch "%^>%" "/^>/" "{*}" # splits fasta batch file into many files
                                     # at '>'
sort <file>                          # sorts single file, many files and can merge (-m)
                                     # them, -b ignores leading white space, ...
sort -k 2,2 -k 3,3n input_file > output_file # sorts in table column 2 alphabetically and
                                     # column 3 numerically, '-k' for column, '-n' for
                                     # numeric
sort input_file | uniq > output_file # uniq command removes duplicates and creates file/table
                                     # with unique lines/fields
join -1 1 -2 1 <table1> <table2>     # joins two tables based on specified column numbers
                                     # (-1 file1, 1: col1; -2: file2, col2). It assumes
                                     # that join fields are sorted. If that is not the case,
                                     # use the next command:
sort table1 > table1a; sort table2 > table2a; join -a 1 -t "$(echo -e '\t')" table1a table2a > table3                               # '-a <table>' prints all lines of specified table!
                                     # Default prints only all lines the two tables have in
                                     # common. '-t "$(echo -e '\t')" ->' forces join to
                                     # use tabs as field separator in its output. Default is
                                     # space(s)!!!
cat my_table | cut -d , -f1-3        # cut command prints only specified sections of a table,
                                     # -d specifies here comma as column separator (tab is
                                     # default), -f specifies column numbers.
grep                                 # see chapter 4
egrep                                # see chapter 4
```

## Screen

Screen references

1. [Screen Turorial](http://fosswire.com/post/2008/08/video-tutorial-getting-started-with-gnu-screen/)
2. [Screen Cheat Sheet](http://aperiodic.net/screen/quick_reference)

### Starting a New Screen Session

```bash
screen                 # Start a new session
screen -S <some-name>  # Start a new session and gives it a name
```

Commands to Control Screen

```bash
Ctrl-a d #  Detach from the screen session
Ctrl-a c # Create a new window inside the screen session
Ctrl-a Space # Switch to the next window
Ctrl-a a # Switch to the window that you were previously on
Ctrl-a " # List all open windows. Double-quotes " are typed with the Shift key
Ctrl-d or type exit # Exit out of the current window. Exiting form the last window will end the screen session
Ctrl-a [ # Enters the scrolling mode. Use Page Up and Page Down keys to scroll through the window. Hit the Enter key twice to return to normal mode.
```

### Attaching to Screen Sessions

From any computer, you can attach to a screen session after SSH-ing into a server.

```bash
screen -r              # Attaches to an existing session, if there is only one
screen -r              # Lists available sessions and their names, if there are more then one session running
screen -r <some-name>  # Attaches to a specific session
screen -r <first-few-letters-of-name> # Type just the first few letters of the name
                       # and you will be attached to the session you need
```

### Destroying Screen Sessions

1. Terminate all programs that are running in the screen session. The standard way to do that is: `Ctrl-c`
2. Exit out of your shell: `exit`
3. Repeat steps 1 and 2 until you see the message: `[screen is terminating]`

There may be programs running in different windows of the same screen session. That's why you may need to terminate programs and exit shells multiple time.

### Tabs and a Reasonably Large History Buffer

For a better experience with screen, run

```bash
cp ~/.screenrc ~/.screenrc.backup 2> /dev/null
echo 'startup_message off
defscrollback 10240
caption always "%{=b dy}{ %{= dm}%H %{=b dy}}%={ %?%{= dc}%-Lw%?%{+b dy}(%{-b r}%n:%t%{+b dy})%?(%u)%?%{-dc}%?%{= dc}%+Lw%? %{=b dy}}"
' > ~/.screenrc
```




## Simple One-Liner Shell Scripts

Web page for [script download](http://linuxcommand.org/script_library.php).

Renames many files *.old to *.new. To test things first, replace 'do mv' with 'do echo mv':

```bash
for i in *.input; do mv $i ${i/\.old/\.new}; done
for i in *\ *; do mv "$i" "${i// /_}"; done # Replaces spaces in files by underscores
```

Run an application in loops on many input files:

```bash
for i in *.input; do ./application $i; done
```

Run fastacmd from BLAST program in loops on many *.input files and create corresponding *.out files:

```bash
for i in *.input; do fastacmd -d /data/../database_name -i $i > $i.out; done
```

Run SAM's target99 on many input files:

```bash
for i in *.pep; do target99 -db /usr/../database_name -seed $i -out $i; done
Search in many files for a pattern and print occurrences together with file names.
for j in 0 1 2 3 4 5 6 7 8 9; do grep -iH <my_pattern> *$j.seq; done
```

Example of how to run an interactive application (tmpred) that asks for file name input/output:

```bash
for i in *.pep; do echo -e "$i\n\n17\n33\n\n\n" | ./tmpred $i > $i.out; done
```

Run BLAST2 for all *.fasa1/*.fasta2 file pairs in the order specified by file names and write results into one file:

```bash
for i in *.fasta1; do blast2 -p blastp -i $i -j ${i/_*fasta1/_*fasta2} >> my_out_file; done
```
    This example uses two variables in a for loop. The content of the second variable gets specified in each loop by a replace function.

Runs BLAST2 in all-against-all mode and writes results into one file ('-F F' turns low-complexity filter off):

```bash
for i in *.fasta; do for j in *.fasta; do blast2 -p blastp -F F -i $i -j $j >> my_out_file; done; done;
```

### How to write a real shell script

1. Create file which contains an interpreter as the first line:

   ```bash
   #!/bin/bash
   ```

1. Place shell commands in file below the interpreter line using a text editor.
1. Make file executable:

   ```bash
   chmod +x my_shell_script
   ```

1. Run shell script like this:

   ```bash
   ./my_shell_script
   ```

1. Place it into your /rhome/<username>/bin directory

   ```bash
   mkdir -p ~/bin
   mv my_shell_script ~/bin/
   ```

1. Add the bin path to your shell permanently:

   ```bash
   echo 'export PATH=~/bin:$PATH' >> ~/.bashrc
   source ~/.bashrc
   ```

## Simple One-Liner Perl Scripts

*Small collection of useful one-liners:*

```perl
perl -p -i -w -e 's/pattern1/pattern2/g' my_input_file
            # Replaces a pattern in a file by a another pattern using regular expressions.
            # $1 or \1: back-references to pattern placed in parentheses
            # -p: lets perl know to write program
            # -i.bak: creates backup file *.bak, only -i doesn't
            # -w: turns on warnings
            # -e: executable code follows
```

*Parse lines based on patterns:*

```perl
perl -ne 'print if (/my_pattern1/ ? ($c=1) : (--$c > 0)); print if (/my_pattern2/ ? ($d = 1) : (--$d > 0))' my_infile > my_outfile
            # Parses lines that contain pattern1 and pattern2.
            # The following lines after the pattern can be specified in '$c=1' and '$d=1'.
            # For logical OR use this syntax: '/(pattern1|pattern2)/'.
```

## Remote Copy: wget, scp, ncftp

### Wget

Use wget to download a file from the web:

```bash
wget ftp://ftp.ncbi.nih.... # file download from www; add option '-r' to download entire directories
```

### SCP

Use scp to copy files between machines (ie. laptop to server):

```bash
scp source target # Use form 'userid@machine_name' if your local and remote user ids are different.
                  # If they are the same you can use only 'machine_name'.
```

Here are more scp examples:

```bash
scp user@remote_host:file.name . # Copies file from server to local machine (type from local
                                 # machine prompt). The '.' copies to pwd, you can specify                                              # here any directory, use wildcards to copy many files.

scp file.name user@remote_host:~/dir/newfile.name
                                                                       # Copies file from local machine to server.

scp -r user@remote_host:directory/ ~/dir
                                 # Copies entire directory from server to local machine.
```

### Nice FTP

From the linux command line run ncftp and use it to get files:

```bash
ncftp
ncftp> open ftp.ncbi.nih.gov
ncftp> cd /blast/executables
ncftp> get blast.linux.tar.Z (skip extension: @)
ncftp> bye
```

## Archiving and Compressing

### Creating Archives

```bash
tar -cvf my_file.tar mydir/    # Builds tar archive of files or directories. For directories, execute command in parent directory. Don't use absolute path.    
tar -czvf my_file.tgz mydir/   # Builds tar archive with compression of files or directories. For
                               # directories, execute command in parent directory. Don't use absolute path.
zip -r mydir.zip mydir/        # Command to archive a directory (here mydir) with zip.
tar -jcvf mydir.tar.bz2 mydir/ # Creates *.tar.bz2 archive
```

### Viewing Archives

```bash
tar -tvf my_file.tar
tar -tzvf my_file.tgz
```

### Extracting Archives

```bash
tar -xvf my_file.tar
tar -xzvf my_file.tgz
gunzip my_file.tar.gz # or unzip my_file.zip, uncompress my_file.Z,
                      # or bunzip2 for file.tar.bz2
find -name '*.zip' | xargs -n 1 unzip # this command usually works for unzipping
                      # many files that were compressed under Windows
tar -jxvf mydir.tar.bz2 # Extracts *.tar.bz2 archive
```

Try also:

```bash
tar zxf blast.linux.tar.Z
tar xvzf file.tgz
```

Important options:

```bash
f: use archive file
p: preserve permissions
v: list files processed
x: exclude files listed in FILE
z: filter the archive through gzip
```

## Simple Installs

### Systems-wide installations

### Applications in user accounts

### Installation of RPMs

## Environment Variables

```bash
xhost user@host                # adds X permissions for user on server.
echo $DISPLAY                  # shows current display settings
export DISPLAY=<local_IP>:0    # change environment variable
unsetenv DISPLAY               # removes display variable
env                            # prints all environment variables
```

List of directories that the shell will search when you type a command:

```bash
echo $PATH
```
You can edit your default DISPLAY setting for your account by adding it to file .bash_profile

## Exercises

### Exercise 1

1. Download proteome of Halobacterium spec. with wget and look at it:

   ```
   module load ncbi-blast/2.2.26 # Loads legacy blastall
   wget ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/archaea/Halobacterium_salinarum/representative/GCA_000069025.1_ASM6902v1/GCA_000069025.1_ASM6902v1_protein.faa.gz
   gunzip GCA_000069025.1_ASM6902v1_protein.faa.gz
   mv GCA_000069025.1_ASM6902v1_protein.faa AE004437.faa
   less AE004437.faa  # press q to quit
   ```

1. Simple Analysis:

   a. How many predicted proteins are there?

   ```bash
   grep '^>' AE004437.faa --count
   ```

   b. How many proteins contain the pattern "WxHxxH" or "WxHxxHH"?

   ```bash
   egrep 'W.H..H{1,2}' AE004437.faa --count
   ```

   c. Use the find function (/) in 'less' to fish out the protein IDs containing the pattern or more elegantly do it with awk:

   ```bash
   awk --posix -v RS='>' '/W.H..(H){1,2}/ { print ">" $0;}' AE004437.faa | less # press q to quit
   ```

1. Create a BLASTable database with formatdb:

   ```bash
   ls # before
   formatdb -i AE004437.faa -p T -o T
   ls # after
   '-p F' for nucleotide and '-p T' for protein database; '-o T' parse SeqId and create indexes
   ```

1. Generate myseq.fasta

   a. Generate list of sequence IDs for the above pattern match result (i.e. retrieve my_IDs from step 2c). Alternatively, download the pre-generated file with wget.

   b. Retrieve the corresponding sequences for these IDs with the fastacmd command from the blastable database:

   ```bash
   wget https://cluster.hpcc.ucr.edu/~tgirke/Documents/UNIX/my_IDs
   fastacmd -d AE004437.faa -i my_IDs > myseq.fasta
   less myseq.fasta # press q to quit
   ```

1. (Optional) Looking at several different patterns:

   a. Generate several lists of sequence IDs from various pattern match results (i.e. retrieve a.my_ids, b.my_ids, and  c.my_ids from step 2c).

   b. Retrieve the sequences in one step using the fastacmd in a for-loop:

   ```bash
   for i in *.my_ids; do fastacmd -d AE004437.faa -i $i > $i.fasta; done
   ```

1. Run blastall with a few proteins in myseq.fasta against your newly created Halobacterium proteome database.

   Create first a complete blast output file  including alignments. In a second step use the 'm -8' option to obtain a tabular output (i.e. tab separated values):

   ```bash
   blastall -p blastp -i myseq.fasta -d AE004437.faa -o blastp.out -e 1e-6 -v 10 -b 10
   blastall -p blastp -i myseq.fasta -d AE004437.faa -m 8 -e 1e-6 > blastp.tab
   less blastp.out # press q to quit
   less -S blastp.tab # -S disables line wrapping, press q to quit
   ```

   The filed descriptions of the Blast tabular output (from the "-m 8" option) are available here:

   ```
   1  Query (The query sequence id)
   2  Subject (The matching subject sequence id)
   3  % id
   4  alignment length
   5  mismatches
   6  gap openings
   7  q.start
   8  q.end
   9  s.start
   10 s.end
   11 e-value
   12 bit score
   ```

Is your blastp.out file equivalent to this one?

1. Parse blastall output into Excel spread sheet

   a. Using biocore parser

   ```bash
   blastParse -i blastp.out -o blast.xls -c 5
   ```

   b. Using BioPerl parser

   ```bash
   bioblastParse.pl blastp.out > blastparse.txt     
   ```

### Exercise 2

Split sample fasta batch file with csplit (use sequence file myseq.fasta from Exercise 1).

```bash
csplit -z myseq.fasta '/>/' '{*}'
```

Delete some of the files generated by csplit
Concatenate single fasta files from (step 1) into to one file with cat (e.g. `cat file1 file2 file3 > bigfile`).
BLAST two related sequences, retrieve the result in tabular format and use `comm` to identify common hit IDs in the two tables.

### Exercise 3

Run HMMPFAM search with proteins from Exercise 1 against Pfam database (will take ~3 minutes)

```bash
hmmscan -E 0.1 --acc /srv/projects/db/pfam/2011-12-09-Pfam26.0/Pfam-A.hmm myseq.fasta > output.pfam
```

Easier to parse/process tabular output

```bash
hmmscan -E 0.1 --acc --tblout output.pfam /srv/projects/db/pfam/2011-12-09-Pfam26.0/Pfam-A.hmm myseq.fasta # also try --domtblout
```

Which query got the most hits? How many hits were found that query?

### Exercise 4

Create multiple alignment with ClustalW (e.g. use sequences with 'W.H..HH' pattern)

```bash
clustalw myseq.fasta
mv myseq.aln myalign.aln
```

### Exercise 5

Reformat alignment into PHYILIP format using 'seqret' from EMBOSS

```bash
seqret clustal::myalign.aln phylip::myalign.phylip
```

### Exercise 6

Create neighbor-joining tree with PHYLIP

```bash
cp myalign.phylip infile
protdist     # creates distance matrix (you may need to press 'R' and then 'Y')
cp outfile infile
neighbor     # use default settings (press 'Y')
cp outtree intree
```

retree # displays tree and can use midpoint method for defining root of tree, my typical command sequence is: 'N' (until you see PHYLIP) 'Y' 'M' 'W' 'R' 'R' 'X'

```bash
cp outtree tree.dnd
```

View your tree in TreeBrowse or open it in TreeView
