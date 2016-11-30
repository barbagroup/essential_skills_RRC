# Pipes and intro to unix utilities

We just learned about redirecting output to files using the `>` operator. In
addition to redirecting a data stream to a file, we can also _intercept_ that
stream of information and perform another operation on it. 

To do this we use the `|` operator which we call a pipe. 

Pipes allow a user to string together a series of commands, a "command
pipeline", and there are many useful utilites that are commonly installed on
UNIX systems. 

The use of these many small programs is only clear when we use it in concert
with pipes, so we're going to learn about them at the same time.

## `cat`

In the redirection exercise we wrote the contents of the command `ls -F` into a
file called `filelist`. When we checked to see if it worked, we opened the file
up in `nano`. That didn't take very long, but it can be a pain if you need to
look through the contents of a number of files.

Now, we didn't need to _edit_ `filelist`, right? We just wanted to look at it. 
This is the perfect job for `cat`!

`cat` dumps the contents of a file into `stdout` (by default). 

Try it out on `filelist` to see what happens.

```bash
$ cat filelist
```
```bash
Desktop/
Documents/
Downloads/
Music/
Pictures/
Public/
Templates/
Videos/
```

## Time to pipe!

Remember `wc -l`? We used it to count the lines in `filelist`. We did:

```bash
$ wc -l filelist
```
```bash
8 filelist
```

But instead of doing it this way, we can also **pipe** the _contents_ of
`filelist` to `wc`.

Try it out!

```bash
$ cat filelist | wc -l
```
```bash
8
```

What just happened? 

We used `cat` to dump the contents of `filelist` to the screen (`stdout`). But
then, instead of printing the contents, we intercepted them with the pipe and
instead fed them into `wc`. 

## Skip `filelist`

We used `>` to redirect the contents of `ls -F`, then used `cat` to dump the
contents of `filelist` and then piped those contents to `wc`. Are all of these
steps necessary?

No! How about: 

```bash
ls -F | wc -l
```
```bash
9
```

Any output can be piped to (nearly) any other program. 





Use `>` for redirecting to files, but use `|` to _intercept_ and perform further
transformations.

Introduce `wc`, `uniq`, `sort`, `less`, `grep`, `xargs`

Not pipes, but important
