---
type: docs
linkTitle: Variables
title: Variables
permalink: manuals_linux-basics_variables.html
---

## Variables

The HPCC cluster uses bash as the default shell environment. Within this environment, variables can be set and reused.

For example:
```
MYVAR=’Something’
export MYVAR=’Something’
echo $MYVAR
```

### Default Variables

Some softwares utilize this feature and require that specific environment variables be set.
For example, every time you login, the following variables are set by default:

```
echo $HOME               #Contains your home path
echo $USER               #Contains your username
echo $PATH               #Contains paths of executables
echo $LD_LIBRARY_PATH    #Contains paths of library dependencies
```


### Finding Variables

To see a list of all variables currently set in your shell, use the `env` command.
You can also `grep` through this list to find variables, like so:

```
env | grep -i home
```

Or if you are in a `Slurm` job, you can find all related `Slurm` variables:

```
env | grep -i slurm
```

### Setting variables

Try to choose unique names when setting variables.
It is best to not overwrite a variable that is already set, unless on purpose.

To set a variable in your current shell, you can do so like this:

```
MYVAR='Something Important'
```

> Notice that there is no spaces around the `=` sign.

If you would like to set a variable that is carried over to all other commands or sub-shells, then it must be `exported`:

```
export MYVAR='Something Important'
```
