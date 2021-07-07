---
title: Piping
linkTitle: Piping
type: docs
weight: 8
---

## Piping

One of the the most powerful things you can do in Linux is piping.
This allows chaining of commands so that the output (`STDOUT`) of one command is the input (`STDIN`) for another.
This is done by placing a `|` (pipe) character between the commands.
Please note that not all commands support this, for example if your command is not taking input from `STDIN`.

As an example, let's collect all the lines where `pattern` is found in a file, then count how many lines were found:

```
grep 'pattern' filename | wc -l
```

You can pipe as many commands together as you like, not just two.
For example, you can combined two CSV files and extract the first column, then filter for only unique values:

```
cat filename1.csv filename2.csv | cut -f 1 | sort | uniq
```

For a few more simple examples, please visit here [Pipe, Grep and Sort Command in Linux/Unix with Examples](https://www.guru99.com/linux-pipe-grep.html).
Or you can try searching Google for even more complex examples, the possibilities are endless.
