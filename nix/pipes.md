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

### Quick exercise:

Why does `cat filelist | wc -l` return `8` while `ls -F | wc -l` return `9`?

## `grep`

`grep` is your best friend, you just don't know it yet. `grep` does stand for
something, but it's long and confusing, so just accept that `grep` is `grep`. 

`grep` searches through text files and streams for matches. It is one of the
most powerful tools in the UNIX toolbox. It's also _42 years old_. And we still
use it. It's that good.

Try it out by piping the contents of `ls -F` and `grep`ping for "Do"

```bash
$ ls -F | grep Do
```
```bash
Documents/
Downloads/
```

### Exercise

There are obviously two files/folders that contain `Do` that `grep` has matched.
But what if there were hundreds? How can we count the number of results from a
`grep`? 

Use `ls`, `grep` and any tools we've already learned about to get the command
line to spit out the number of files/folders that contain `Do` in their title.

## `sort`

#TODO: get the copa america goals list using wget

Ok! We have downloaded a list of goals scored in the 2016 Copa America, let's
take a look at what the file contains:

```bash
$ cat copa_america_goals 
```
```bash
1 Miku
1 Neymar
1 Robinho
3 Sergio Aguero
2 Charles Aranguiz
3 Lucas Barrios
1 Edgar Benitez
2 Miller Bolanos
1 Andrew Carrillo
1 Douglas Costa
1 Christian Cueva
2 Angel Di Maria
1 Roberto Firmino
1 Jose Gimenez
1 Derlis Gonzalez
4 Paolo Guerrero
1 Nelson Haedo Valdez
2 Gonzalo Higuain
1 Mauricio Isla
2 Raul Jimenez
2 Marcelo Martins Moreno
1 Gary Medel
1 Lionel Messi
1 Jeison Murillo
1 Javier pastore
1 Claudio Pizarro
1 Ronald Raldes
1 Cristian Rodriguez
1 Marcos Rojo
1 Salomon Rondon
1 Alexis Sanchez
1 Thiago Silva
1 Martis Smedberg-Dalence
2 Enner Valencia
4 Eduardo Vargas
3 Arturo Vidal
2 Matias Vuoso
```

The first column is goals, then first names, then last names. And of course,
some players only have one name. How many players scored 4 goals? We can `grep`
for that, which will definitely work, but we can also sort the list easily using
the `sort` command.  Try it out!

```bash
$ cat copa_america_goals | sort
```
```bash
1 Alexis Sanchez
1 Andrew Carrillo
1 Christian Cueva
1 Claudio Pizarro
1 Cristian Rodriguez
1 Derlis Gonzalez
1 Douglas Costa
1 Edgar Benitez
1 Gary Medel
1 Javier pastore
1 Jeison Murillo
1 Jose Gimenez
1 Lionel Messi
1 Marcos Rojo
1 Martis Smedberg-Dalence
1 Mauricio Isla
1 Miku
1 Nelson Haedo Valdez
1 Neymar
1 Roberto Firmino
1 Robinho
1 Ronald Raldes
1 Salomon Rondon
1 Thiago Silva
2 Angel Di Maria
2 Charles Aranguiz
2 Enner Valencia
2 Gonzalo Higuain
2 Marcelo Martins Moreno
2 Matias Vuoso
2 Miller Bolanos
2 Raul Jimenez
3 Arturo Vidal
3 Lucas Barrios
3 Sergio Aguero
4 Eduardo Vargas
4 Paolo Guerrero
```

And we see that at the bottom of the sorted list there are two players who
scored 4 goals in the Copa. 

Now, sorting goal scorers by last name seems a little strange if we care about
the number of goals scored. Let's save the list of goals but sort it by the
number of goals. How should we do that?

```bash
$ cat copa_america_goals | sort > copa_goals_sorted
```

And remember, there's no output to the screen (`stdout`) because we _redirected_
it to a new file. We can `cat` the new file to make sure it worked as we expect.

```bash
$ cat copa_goals_sorted 
```
```bash
1 Alexis Sanchez
1 Andrew Carrillo
1 Christian Cueva
1 Claudio Pizarro
1 Cristian Rodriguez
1 Derlis Gonzalez
1 Douglas Costa
1 Edgar Benitez
1 Gary Medel
1 Javier pastore
1 Jeison Murillo
1 Jose Gimenez
1 Lionel Messi
1 Marcos Rojo
1 Martis Smedberg-Dalence
1 Mauricio Isla
1 Miku
1 Nelson Haedo Valdez
1 Neymar
1 Roberto Firmino
1 Robinho
1 Ronald Raldes
1 Salomon Rondon
1 Thiago Silva
2 Angel Di Maria
2 Charles Aranguiz
2 Enner Valencia
2 Gonzalo Higuain
2 Marcelo Martins Moreno
2 Matias Vuoso
2 Miller Bolanos
2 Raul Jimenez
3 Arturo Vidal
3 Lucas Barrios
3 Sergio Aguero
4 Eduardo Vargas
4 Paolo Guerrero
```

```bash
$ cat copa_goals_sorted | grep Alexis
```
```bash
1 Alexis Sanchez
```
