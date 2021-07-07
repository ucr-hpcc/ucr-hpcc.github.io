---
title: Finding Things
linkTitle: Finding Things
type: docs
weight: 5
---

## Find Files

```bash
find ~ -name "*pattern*"          # Searches for *pattern* in and below your home directory
find ~ -iname "*pattern*"         # Same as above, but case insensitive
find ~ -type f -mtime -2          # Searches for files you have modified in the last two days
```

Useful `find` arguments:

* `-user <userName>`
* `-group <groupName>`
* `-ctime <number of days ago changed>`
* `-exec <command to run on each file> {} \;`

## Find Text

```bash
grep "pattern" <FILENAME>                              # Provides lines in a file where "pattern" appears
grep -H "pattern"                                      # -H prints out file name in front of pattern
find ~ -name "*.txt" -exec grep -H "pattern" {} \;     # Search lines where "pattern" appears in files with names that end with ".txt"
```

## Find Applications

```bash
which <APPLICATION_NAME>                # Location of application
whereis <APPLICATION_NAME>              # Searches for executables in set of directories
rpm -qa | grep "pattern"                # List all RPM packages and filter based on "pattern"
```
