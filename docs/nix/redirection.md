# Redirection

What happens when we run `ls`? This isn't a trick question. 

```bash
$ ls -F
```
```bash
Desktop/  Documents/  Downloads/  Music/  Pictures/  Public/  Templates/  Videos/
```

We get a list of the files and folders in the current directory _printed_ to the
screen. But what if we didn't want it to print to the screen but instead wanted
to save it to a file somewhere?

Easy! 

By default, commands run on the command line print to `stdout` (standard
output). If we want to specify a different location to print to, we use the `>`
symbol.

Try it out:

```bash
$ ls -F > filelist
```

No output appeared on the screen (`stdout`). Let's check what's in `filelist`

```bash
$ nano filelist
```

There it is! 

This might not seem useful to begin with, but once we combine it with some other
command line utilities you'll begin to see what we can do!
