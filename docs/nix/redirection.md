# Redirection

What happens when we run `ls`? This isn't a trick question. 

```text
$ ls -F
```
```text
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

```text
$ ls -F > filelist
```

No output appeared on the screen (`stdout`). Let's check what's in `filelist`

```text
$ nano filelist
```

There it is! 

Now, what do we do with it...? How about we try counting the number of lines in
`filelist`? 

Imagine we have a MUCH bigger directory and we want to know how many files and
folders are in it. When we redirect `ls` to a file, every file and folder is
written to a separate line; if we count the number of lines, we know how many
files there are!

How do we count the number of lines? We use `wc` (wordcount)

## `wc`

Yes, it's _word_count, but it counts lines, words and characters. We'll
play with `wc` more later, but for now, let's just count the number of lines in
`filelist`. To specify that we want the number of _lines_ in a file we use the
`-l` flag.

```text
$ wc -l filelist
```
```text
8 filelist
```

Cool! `wc` tells us that `filelist` has 8 lines, which means we have 8
files/folders in the HOME directory. (Yes, we already knew that since we can
count, but still...)


