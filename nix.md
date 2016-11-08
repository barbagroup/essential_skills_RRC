# First Commands

Not in order

`ls`, `cp`, `mv`, `cat`, `rm`, `echo`, `touch`, `head`, `tail`,
`whoami`, `pwd`, `cd`

Welcome!

The command line can be a little intimidating at first, but it is a powerful and
efficient way of interacting with your computer. It's also the lingua franca
when dealing with computing clusters and remote machines.

Before we do anything else, let's figure out who we are. We can ask on the
command line:

```console
$ whoami
```
```console
gil
```

That's my username! 
Now that we know who we are, time to figure out _where_ we are.  To do that, we ask the terminal to `print working directory` or `pwd`

```console
$ pwd
```
```console
/home/gil/
```

We're in the "home directory" for our user. To understand the "home directory",
let's take a brief moment to look at how the file system is organized.

**Inverted tree diagram a la software carpentry**


Let's look around

```console
$ ls
```

```console
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

I think those are folders?  How can we tell? Use the `-F` flag

```console
$ ls -F
```

```console
Desktop/  Documents/  Downloads/  Music/  Pictures/  Public/  Templates/  Videos/
```

They all have a trailing slash, so they're all folders.
What other options does `ls` have?

```console
$ ls --help
```

```console
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.
  -a, --all                  do not ignore entries starting with .
  -A, --almost-all           do not list implied . and ..
      --author               with -l, print the author of each file
  -b, --escape               print C-style escapes for nongraphic characters
      --block-size=SIZE      scale sizes by SIZE before printing them; e.g.,
                               '--block-size=M' prints sizes in units of
                               1,048,576 bytes; see SIZE format below
  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                               modification of file status information);
                               with -l: show ctime and sort by name;
                               otherwise: sort by ctime, newest first
  -C                         list entries by columns
      --color[=WHEN]         colorize the output; WHEN can be 'always' (default
                               if omitted), 'auto', or 'never'; more info below
  -d, --directory            list directories themselves, not their contents
  -D, --dired                generate output designed for Emacs' dired mode
  -f                         do not sort, enable -aU, disable -ls --color
  -F, --classify             append indicator (one of */=>@|) to entries
      --file-type            likewise, except do not append '*'
      --format=WORD          across -x, commas -m, horizontal -x, long -l,
                               single-column -1, verbose -l, vertical -C
      --full-time            like -l --time-style=full-iso
  -g                         like -l, but do not list owner
      --group-directories-first
                             group directories before files;
                               can be augmented with a --sort option, but any
                               use of --sort=none (-U) disables grouping
  -G, --no-group             in a long listing, don't print group names
  -h, --human-readable       with -l and/or -s, print human readable sizes
                               (e.g., 1K 234M 2G)
      --si                   likewise, but use powers of 1000 not 1024
  -H, --dereference-command-line
                             follow symbolic links listed on the command line
      --dereference-command-line-symlink-to-dir
                             follow each command line symbolic link
                               that points to a directory
      --hide=PATTERN         do not list implied entries matching shell PATTERN
                               (overridden by -a or -A)
      --indicator-style=WORD  append indicator with style WORD to entry names:
                               none (default), slash (-p),
                               file-type (--file-type), classify (-F)
  -i, --inode                print the index number of each file
  -I, --ignore=PATTERN       do not list implied entries matching shell PATTERN
  -k, --kibibytes            default to 1024-byte blocks for disk usage
  -l                         use a long listing format
  -L, --dereference          when showing file information for a symbolic
                               link, show information for the file the link
                               references rather than for the link itself
  -m                         fill width with a comma separated list of entries
  -n, --numeric-uid-gid      like -l, but list numeric user and group IDs
  -N, --literal              print raw entry names (don't treat e.g. control
                               characters specially)
  -o                         like -l, but do not list group information
  -p, --indicator-style=slash
                             append / indicator to directories
  -q, --hide-control-chars   print ? instead of nongraphic characters
      --show-control-chars   show nongraphic characters as-is (the default,
                               unless program is 'ls' and output is a terminal)
  -Q, --quote-name           enclose entry names in double quotes
      --quoting-style=WORD   use quoting style WORD for entry names:
                               literal, locale, shell, shell-always,
                               shell-escape, shell-escape-always, c, escape
  -r, --reverse              reverse order while sorting
  -R, --recursive            list subdirectories recursively
  -s, --size                 print the allocated size of each file, in blocks
  -S                         sort by file size, largest first
      --sort=WORD            sort by WORD instead of name: none (-U), size (-S),
                               time (-t), version (-v), extension (-X)
      --time=WORD            with -l, show time as WORD instead of default
                               modification time: atime or access or use (-u);
                               ctime or status (-c); also use specified time
                               as sort key if --sort=time (newest first)
      --time-style=STYLE     with -l, show times using style STYLE:
                               full-iso, long-iso, iso, locale, or +FORMAT;
                               FORMAT is interpreted like in 'date'; if FORMAT
                               is FORMAT1<newline>FORMAT2, then FORMAT1 applies
                               to non-recent files and FORMAT2 to recent files;
                               if STYLE is prefixed with 'posix-', STYLE
                               takes effect only outside the POSIX locale
  -t                         sort by modification time, newest first
  -T, --tabsize=COLS         assume tab stops at each COLS instead of 8
  -u                         with -lt: sort by, and show, access time;
                               with -l: show access time and sort by name;
                               otherwise: sort by access time, newest first
  -U                         do not sort; list entries in directory order
  -v                         natural sort of (version) numbers within text
  -w, --width=COLS           set output width to COLS.  0 means no limit
  -x                         list entries by lines instead of by columns
  -X                         sort alphabetically by entry extension
  -Z, --context              print any security context of each file
  -1                         list one file per line.  Avoid '\n' with -q or -b
      --help     display this help and exit
      --version  output version information and exit

The SIZE argument is an integer and optional unit (example: 10K is 10*1024).
Units are K,M,G,T,P,E,Z,Y (powers of 1024) or KB,MB,... (powers of 1000).

Using color to distinguish file types is disabled both by default and
with --color=never.  With --color=auto, ls emits color codes only when
standard output is connected to a terminal.  The LS_COLORS environment
variable can change the settings.  Use the dircolors command to set it.

Exit status:
 0  if OK,
 1  if minor problems (e.g., cannot access subdirectory),
 2  if serious trouble (e.g., cannot access command-line argument).

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/ls>
or available locally via: info '(coreutils) ls invocation'
```

Oh...  lots... but we aren't going to worry about that. 

For now, let's look inside the `Desktop/` folder where we downloaded that zip
file at the beginning of the workshop.

If we want to use `ls` on a different folder than the _current_ folder, just
pass the name of the folder you want to look in:

```console
$ ls -F Desktop/
```
```console
workshop_data.zip
```

There it is! Ok, we know where the zip file is, time to _change directory_ to the folder `Desktop/`.  To do this, we use the `cd` command:

```console
$ cd Desktop
```

Now let's check in with `pwd` again:

```console
$ pwd
```

```console
/home/gil/Desktop
```

Ok! Cool! We moved! Now if we run `ls` we should see the zip file in here.

```console
$ ls -F
```
```console
workshop_data.zip
```

And there it is! Ok. We'll come back here in a second, but first let's explore a
little more. Let's go back to the "home directory".

How do we do that...?

The home directory has the same name as our username. Let's try that!

```console
$ cd gil
```
```console
cd: no such file or directory: gil
```

That doesn't work. We're at the end of a branch of the tree that makes up the
filesystem. There has to be a way to go back -- what are we missing?

Let's use `ls` again, but this time add in the `-a` flag for "show all"

```console
$ ls -a
```

```console
.  ..  workshop_data.zip
```

AHA! There are two more entries that we didn't see before: `.` and `..`
What are those? Learn by doing, I say:

```console
$ cd .
```

```console
$ pwd
```

```console
/home/gil/Desktop
```

We're in the same spot. The `.` directory is a special directory in every folder
on the filesystem and it points to the current working directory. 

```console
$ cd ..
```

```console
$ pwd
```
```console
/home/gil/
```

We made it back _home_! The `..` directory is another special directory, but this one always points to the _parent_ of the current directory.

Let's try moving up a few more times!

```console
$ cd ..
```

```console
$ pwd
```
```console
/home
```

```console
$ cd ..
```

```console
$ pwd
```
```console
/
```

```console
$ cd ..
```

```console
$ pwd
```
```console
/
```

We can't go back any further because we are at the _root_ of the file _tree_.

Now that we've had a look around, time to go back to the home directory. 
Let's use a little shortcut:

```console
$ cd
```

```console
$ pwd
```
```console
/home/gil/
```

If you don't pass a target to `cd` it will always take you back to your home
directory by default. This is a nice option if you're looking around in a very
deep directory tree.

# Tab completion

Before we go any further, let's take a look at one of the most useful features
of the *nix command line: tab completion




# Environment Variables
## `PATH`

# Pipes

Introduce `wc`, `uniq`, `sort`, `less`, `grep`, `xargs`

# Editor

Use `nano` (probably) or `exofrills`

# `vi` movement commands

`vi` or `vim` is a popular and powerful command line text editor. It's also
notoriously difficult for beginners. It's too much to try to learn `vi` on top
of everything else we're going to look at, but we do need to look at a few `vi`
commands.

Why? Because a lot of *nix programs inherited parts of their interface from `vi`
and you'll need to know how to interact with them.

| Command         | Action       |
|-----------------|--------------|
| j or Down Arrow | Down         |
| k or Up Arrow   | Up           |
| q               | Quit         |
| g or <          | Go to top    |
| G or >          | Go to bottom |

# copa america goals example

use this for cat, sort, grep, head, tail and pipes and redirects

# uber example

Download and unzip file from here:

Should have folder `uber-trip-data`.  `cd` to that directory and take a look.

```console
$ cd uber-trip-data/
```

```console
$ ls
```

```console
taxi-zone-lookup.csv     uber-raw-data-janjune-15.csv.zip  uber-raw-data-may14.csv
uber-raw-data-apr14.csv  uber-raw-data-jul14.csv           uber-raw-data-sep14.csv
uber-raw-data-aug14.csv  uber-raw-data-jun14.csv
```

We have several raw data files (so named). `csv` files divided by month and also
a zip file. We'll leave the zip file alone for the moment. What questions can we
answer about this dataset from the command line?

First, it would help to know what these files contain. We can use `head` to
display the first ten lines of one of the raw files.

```console
$ head uber-raw-data-apr14.csv
```

```console
"Date/Time","Lat","Lon","Base"
"4/1/2014 0:11:00",40.769,-73.9549,"B02512"
"4/1/2014 0:17:00",40.7267,-74.0345,"B02512"
"4/1/2014 0:21:00",40.7316,-73.9873,"B02512"
"4/1/2014 0:28:00",40.7588,-73.9776,"B02512"
"4/1/2014 0:33:00",40.7594,-73.9722,"B02512"
"4/1/2014 0:33:00",40.7383,-74.0403,"B02512"
"4/1/2014 0:39:00",40.7223,-73.9887,"B02512"
"4/1/2014 0:45:00",40.762,-73.979,"B02512"
"4/1/2014 0:55:00",40.7524,-73.996,"B02512"
```

They weren't kidding when they said "raw" data. What do we have here? Looks like
a date and time (these are pickup times), the lat-long of the pickup location
and some "Base" id that we don't care about right now.

What can we take away from this?

For one, that the number of lines in this file is how many pickups Uber made
during the month of April, 2014. That sounds like interesting information. We
can use `wc` or `wordcount` to count the number of _lines_ in a file by using
the `-l` flag.

```console
$ wc -l uber-raw-data-apr14.csv
```

```console
564517 uber-raw-data-apr14.csv
```

We know now that Uber provided more than half a million rides in New York City
in April of 2014. Let's take a look at how that figure changes month-to-month!

We can run the same `wc` command but now use the `*` wildcard to get the
linecount of every file in the directory.


```console
$ wc -l *
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   829276 uber-raw-data-aug14.csv
   284595 uber-raw-data-janjune-15.csv.zip
   796122 uber-raw-data-jul14.csv
   663845 uber-raw-data-jun14.csv
   652436 uber-raw-data-may14.csv
  1028137 uber-raw-data-sep14.csv
  4818928 total
```

Cool, but the linecount of a zip file doesn't really make any sense. To be a
little more specific, restrict `wc` to only look at `csv` files.

```console
$ wc -l *.csv
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   829276 uber-raw-data-aug14.csv
   796122 uber-raw-data-jul14.csv
   663845 uber-raw-data-jun14.csv
   652436 uber-raw-data-may14.csv
  1028137 uber-raw-data-sep14.csv
  4534333 total
```

Better. `wc` outputs files in the order it gets them, which in this case is the
order they exist in the directory. And that's alphabetical order. The names of
months aren't hugely useful when sorting alphabetically.

Let's use the `sort` command to sort the results from `wc`. We can pipe the
output of `wc` to `sort` using the `|` character. Remember, the pipe takes the
output from the previous command and hands it off to the following command.

```console
$ wc -l *.csv | sort
```

```console
        0 taxi-zone-lookup.csv
  1028137 uber-raw-data-sep14.csv
  4534333 total
   564517 uber-raw-data-apr14.csv
   652436 uber-raw-data-may14.csv
   663845 uber-raw-data-jun14.csv
   796122 uber-raw-data-jul14.csv
   829276 uber-raw-data-aug14.csv
```

Hmmm.  That looks a little funny.  Can you see what `sort` did?

Yeah, it sorted things alphanumerically, which isn't helpful since it only looks
at leading digits. We want to use the number of lines in each file as the
sorting criteria.

To do this, we can use the `-n` flag with `sort` to specify a "numerical" sort.

This may start to look a little confusing, but remember, we're just building up
a command using smaller commands. We use the `-l` flag with `wc` to count the
number of lines, then pipe that output to `sort` where we use the `-n` flag to
require numerical sorting.

```console
$ wc -l *.csv | sort -n
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   652436 uber-raw-data-may14.csv
   663845 uber-raw-data-jun14.csv
   796122 uber-raw-data-jul14.csv
   829276 uber-raw-data-aug14.csv
  1028137 uber-raw-data-sep14.csv
  4534333 total
```

Ok! Now we have the raw data files sorted by number of lines, which we know is
equivalent to number of rides. And look, now the months are in the correct
order. That wasn't necessarily expected, but looking at this output we can see
that Uber is expanding at a pretty fast pace in 2014; they nearly doubled their
usage numbers in 5 months!

This data set is missing the last quarter of 2014, but we have the first half of
2015 available, so we can check if the trend continues (is there a ceiling for
Uber requests in NYC?)

First, unzip the file containing the 2015 data.

```console
$ unzip uber-raw-data-janjune-15.csv.zip
```

```console
Archive:  uber-raw-data-janjune-15.csv.zip
  inflating: uber-raw-data-janjune-15.csv  
   creating: __MACOSX/
  inflating: __MACOSX/._uber-raw-data-janjune-15.csv  
```

Now we know that whoever created this zip file uses a Mac. But that's not really
important. Let's take another look at the line counts.

```console
$ wc -l *.csv | sort -n
```

```console
        0 taxi-zone-lookup.csv
   564517 uber-raw-data-apr14.csv
   652436 uber-raw-data-may14.csv
   663845 uber-raw-data-jun14.csv
   796122 uber-raw-data-jul14.csv
   829276 uber-raw-data-aug14.csv
  1028137 uber-raw-data-sep14.csv
 14270480 uber-raw-data-janjune-15.csv
 18804813 total
```

Wow! 14+ million rides! Impressive! But this data layout is different from the
2014 data. The six months are all in the same file. Not cool. So what now? 

First, let's see what the data looks like in the combined file.

```console
$ head uber-raw-data-janjune-15.csv
```

```console
Dispatching_base_num,Pickup_date,Affiliated_base_num,locationID
B02617,2015-05-17 09:47:00,B02617,141
B02617,2015-05-17 09:47:00,B02617,65
B02617,2015-05-17 09:47:00,B02617,100
B02617,2015-05-17 09:47:00,B02774,80
B02617,2015-05-17 09:47:00,B02617,90
B02617,2015-05-17 09:47:00,B02617,228
B02617,2015-05-17 09:47:00,B02617,7
B02617,2015-05-17 09:47:00,B02764,74
B02617,2015-05-17 09:47:00,B02617,249
```

Very uncool. First, the data is in a different format than the previous files we
looked at. Worse, the first pickup listed is in May? Either the file is
mislabeled (bad) or it isn't even sorted (bad).

Let's look at a few more lines to see if we can figure out which bad scenario we
have. 

We can use `tail` to peek at the _last_ 10 lines in the file. How do those look?


```console
$ tail uber-raw-data-janjune-15.csv
```

```console
B02765,2015-05-08 15:42:00,B02764,79
B02765,2015-05-08 15:42:00,B02765,37
B02765,2015-05-08 15:42:00,B02765,161
B02765,2015-05-08 15:42:00,B02765,7
B02765,2015-05-08 15:43:00,B02711,25
B02765,2015-05-08 15:43:00,B02765,186
B02765,2015-05-08 15:43:00,B02765,263
B02765,2015-05-08 15:43:00,B02765,90
B02765,2015-05-08 15:44:00,B01899,45
B02765,2015-05-08 15:44:00,B02682,144
```

Not looking good.  Is this all just in May?  Let's look through a larger number of lines using `head` and see if we can find a ride that wasn't in May.  Use the `-n` flag with `head` to specify the number of lines to show (the default is 10).

```console
$ head -n 500 uber-raw-data-janjune-15.csv
```

```console
[snip]
B02598,2015-01-18 11:06:58,B02598,7
B02598,2015-01-18 18:55:46,B02598,141
B02598,2015-01-18 14:54:28,B02598,249
B02598,2015-01-18 20:48:57,B02598,90
B02598,2015-01-18 09:28:20,B02682,234
B02598,2015-01-18 19:31:14,B02764,13
B02598,2015-01-18 14:13:38,B02598,163
B02598,2015-01-18 22:53:57,B02598,90
B02598,2015-01-18 19:13:00,B02617,246
B02598,2015-01-18 14:53:36,B02598,161
B02598,2015-01-18 02:37:00,B02598,114
B02598,2015-01-18 18:47:01,B02598,113
B02598,2015-01-18 16:06:11,B02598,233
B02598,2015-01-18 15:36:12,B02598,162
B02598,2015-01-18 02:10:39,B02598,50
B02598,2015-01-18 12:18:57,B02764,142
B02598,2015-01-18 14:03:01,B02598,37
```

Ok. 500 lines in, we can see some January pickups. It looks like we have bad
option #2. The data is labeled correctly but isn't sorted. Time to sort it!

Sorting can be expensive, so rather than trying to sort the whole file at once,
let's copy a portion of the big file into a separate file. 

Use the same `head` command we just used, but now, instead of writing it to the
screen, we can _redirect_ that output to another file using `>`. We'll just call
that file `test.csv`.

```console
$ head -n 500 uber-raw-data-janjune-15.csv > test.csv
```

Now it's time to figure out how to sort this data. We can use `sort` the way we
did with `wc` because the information we want to use as the sort key (the date
and time) are embedded in the middle of every line.

Here's one line from `test.csv`:

`B02598,2015-01-18 14:03:01,B02598,37`

We already looked at using `sort` with `fields` and the `-k` flag. Let's try it
here:

We're going to `cat` all of `test.csv`, pipe that into `sort` and then use the
`-k2` flag, which will sort the lines of `test.csv` based on the first character
of the _second_ field/column.

```console
$ cat test.csv | sort -k2 | less
```

That... didn't work. The default field delimiter in `sort` is whitespace, so the
previous command sorted everything based on pickup time, but ignored pickup
date.

How can we change the delimiter character that `sort` uses? Let's check the
`man` page.

```console
$ man sort
```

```console
$ cat test.csv | sort -t "," -k2 | less
```


```console
$ cat test.csv | sort -t "," -k2 > test_sort.csv
```


```console
$ head test_sort.csv 
```


```console
B02598,2015-01-18 00:02:54,,144

B02598,2015-01-18 00:05:05,B02598,50

B02598,2015-01-18 00:06:19,B02598,107

B02598,2015-01-18 00:08:14,B02598,142

B02598,2015-01-18 00:16:58,B02598,107

B02598,2015-01-18 00:30:59,B02598,50

B02598,2015-01-18 00:36:16,B02598,211

B02598,2015-01-18 00:37:16,B02774,141

B02598,2015-01-18 00:45:16,,48

B02598,2015-01-18 00:47:08,B02617,68

```
