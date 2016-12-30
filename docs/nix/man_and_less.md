# `man` pages

Earlier we used the command `ls --help` to display the long list of options that
`ls` supports. The more common way to look up how to use a program is to look at
its "man page", short for manual.

Try opening the `man` page for `ls`

```text
man ls
```

Notice that instead of dumping all of that information to the screen (STDOUT),
we instead end up in something called a "pager". You can move up and down in the
`man` page using the arrow keys. When you want to quit the `man` page, just hit
`q`.

# `less`

We just used `less`. When you open a `man` page, it opens up in `less`, which is
a "pager".

A pager is a program used to view but not edit a text file or text stream. Why
use a pager instead of a text editor? Sometimes you don't _want_ to be able to
edit a file (changing `man` pages is a bad idea). It's also much faster when
dealing with a very large file. A pager can begin to display the beginning of a
file while the rest of it is being loaded in to memory. A text editor has to
first load an entire file before it can display any part of it.

We'll look at a few more ways that `less` can help you in the exercises in the next section. First, let's take a quick pass through the movement commands that `less` supports.

To do that, we can open up another `man` page. How about `sort`?

```text
man sort
```

# `vi` movement commands

`vi` or `vim` is a popular and powerful command line text editor. It's also
notoriously difficult for beginners. It's too much to try to learn `vi` on top
of everything else we're going to look at, but we do need to look at a few `vi`
commands.

Why? Because a lot of *nix programs inherited parts of their interface from `vi`
and you'll need to know how to interact with them. `less` is just one of those
programs.

| Command         | Action            |
|-----------------|-------------------|
| j or Down Arrow | Down              |
| k or Up Arrow   | Up                |
| q               | Quit              |
| g or <          | Go to top         |
| G or >          | Go to bottom      |
| /<text>         | Search for <text> |
