# Navigating the Command Line

Welcome!

The command line can be a little intimidating at first, but it is a powerful and
efficient way of interacting with your computer. It's also the lingua franca
when dealing with computing clusters and remote machines.

## `whoami`

Before we do anything else, let's figure out who we are. We can ask on the
command line:

```bash
$ whoami
```
```bash
gil
```

That's my username!

## `pwd`

Now that we know who we are, time to figure out _where_ we are.  To do that, we ask the terminal to `print working directory` or `pwd`

```bash
$ pwd
```
```bash
/home/gil/
```

We're in the "home directory" for our user. To understand the "home directory",
let's take a brief moment to look at how the file system is organized.

**Inverted tree diagram a la software carpentry**

## `ls`

Let's look around

```bash
$ ls
```

```bash
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

I think those are folders?  How can we tell? Use the `-F` flag

```bash
$ ls -F
```

```bash
Desktop/  Documents/  Downloads/  Music/  Pictures/  Public/  Templates/  Videos/
```

They all have a trailing slash, so they're all folders.
What other options does `ls` have?

```bash
$ ls --help
```

```bash
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

```bash
$ ls -F Desktop/
```
```bash
workshop_data.zip
```

There it is!

## `cd`

Ok, we know where the zip file is, time to _change directory_ to the folder `Desktop/`.  To do this, we use the `cd` command:

```bash
$ cd Desktop
```

Now let's check in with `pwd` again:

```bash
$ pwd
```

```bash
/home/gil/Desktop
```

Ok! Cool! We moved! Now if we run `ls` we should see the zip file in here.

```bash
$ ls -F
```
```bash
workshop_data.zip
```

And there it is! Ok. We'll come back here in a second, but first let's explore a
little more. Let's go back to the "home directory".

How do we do that...?

The home directory has the same name as our username. Let's try that!

```bash
$ cd gil
```
```bash
cd: no such file or directory: gil
```

That doesn't work. We're at the end of a branch of the tree that makes up the
filesystem. There has to be a way to go back -- what are we missing?

Let's use `ls` again, but this time add in the `-a` flag for "show all"

```bash
$ ls -a
```

```bash
.  ..  workshop_data.zip
```

AHA! There are two more entries that we didn't see before: `.` and `..`
What are those? Learn by doing, I say:

```bash
$ cd .
```

```bash
$ pwd
```

```bash
/home/gil/Desktop
```

We're in the same spot. The `.` directory is a special directory in every folder
on the filesystem and it points to the current working directory.

```bash
$ cd ..
```

```bash
$ pwd
```
```bash
/home/gil/
```

We made it back _home_! The `..` directory is another special directory, but this one always points to the _parent_ of the current directory.

Let's try moving up a few more times!

```bash
$ cd ..
```

```bash
$ pwd
```
```bash
/home
```

```bash
$ cd ..
```

```bash
$ pwd
```
```bash
/
```

```bash
$ cd ..
```

```bash
$ pwd
```
```bash
/
```

We can't go back any further because we are at the _root_ of the file _tree_.

Now that we've had a look around, time to go back to the home directory.
Let's use a little shortcut:

```bash
$ cd
```

```bash
$ pwd
```
```bash
/home/gil/
```

If you don't pass a target to `cd` it will always take you back to your home
directory by default. This is a nice option if you're looking around in a very
deep directory tree.

# Tab completion

Before we go any further, let's take a look at one of the most useful features
of the *nix command line: tab completion

Return to the home directory if you aren't there already.
```bash
$ cd
```

Type
```bash
$ cd T
```
then hit the TAB key. Pretty cool, huh?

Whenever you hit the TAB key, the shell will try to complete the remainder of
the line for you! It can't read minds, though. Since `Templates` is the only
directory beginning with `T`, the shell knew what to do. Let's try a different
example.

Type
```bash
$ cd Do
```
then hit the TAB key.

Nothing. But hit it again
```bash
Documents/  Downloads/
```

There are two possible answers based on a prefix `Do`. In this case, tab
completion will only complete up to the common prefix, which is just `Do`. It
needs a little more information to finish the completion. Try adding a `c` and
hitting TAB again.

```bash
$ cd Doc
```
```bash
$ cd Documents/
```
