---
layout: page
title: Linux Basics - Streams
permalink: manuals_linux-basics_streams.html
---

## Streams

On the command line, or terminal, there are three very important lanes where information can be sent, we call these `streams`.
A single command can take information in from `STDIN` and then send information out on both `STDOUT` and `STDERR` simultaneously.

### STDIN

For example, we can send the contents of a file as a `STDIN` steam to the `wc` command in order to count the lines:

```
wc -l < file.txt
```

### STDOUT

The `STDOUT` steam is probably the most often used, since this is how commands send information to the screen.
However, if we do not want the information printed to the screen, we can send it into a file for later review:

```
ls > output.txt    # Overwrite contents in output file with `ls` results
```

You can also append to the same file, if more information is to be saved:

```
ls >> output.txt     # Append results from `ls` to the bottom of the file
```

### STDERR

The error stream is very useful to separate error messages (or warnings) from real output (your results).
Since there is no `-e` flag for the `ls` command this will generate an error. We can then store this error in a by redirecting the error stream with `2>`.

```
ls -e 2> errors.txt
```

### Tips

#### Combined streams

If you want to combined your `STDOUT` with your `STDERR` stream and store it into a file, you can do this with `&>`, like so:

```
command &> output_and_errors.txt
```

#### Trash Streams

If you want to ignore all information from `STDOUT` and `STDERR` you can send both of these streams to the trash (`/dev/null`):

```
command &> /dev/null
```

This can be useful when you are only interested in the resulting file that your command will create.
