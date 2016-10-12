# Intro to `git` and GitHub

## Initial configuration

`git config` to set editor, colors, email, name, etc... (use `nano`)

### User settings

The first time we use `git` on a new computer we need to configure a few details.
We want `git` to know who we are and how to reach us (we'll see why later!).

We're also going to specify a text editor to use with `git` and we want git
output to be colorized.

```console
$ git config --global user.name "Gil Forsyth"
$ git config --global user.email "gilforsyth@gmail.com"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano -w"
```

## Create

Let's create a directory for our work and then move into that directory:

```console
$ mkdir cocktails
$ cd cocktails
```

Now we tell `git` to make `cocktails` a repository--a place where `git` can
store versions of our files:

```console
$ git init
```

If we use `ls` to check the directory's contents, it appears that nothing has
changed:

```console
$ ls
```

But if we add the `-a` flag to show everything, we can see that `git` has
created a hidden directory called `.git`

```console
$ ls -a
```

```console
.    ..    .git
```



### Making commits
`add`, `status`, `init`, `commit`

Not necessarily at the beginning, but I want to emphasize that multiple files
can be added to a commit. This is often glossed over in tutorials and it's
important and powerful.

### Viewing commits
`log`, `checkout`, `diff`

### Collaborating

`clone`, `push`, `pull`, `remote` (note `fetch` and `merge` but do not dwell)

## GitHub add collaborator

Students pair up, push to same repo. Try force a conflict (and also a rejected
push)

## Branching and Pull Requests

This might be presented as a demonstration with a followup assignment.

## Advanced `git` features demo

`bisect` for finding bugs
(ideally an automatic bisect for demo purposes)

Portions of this lesson were adapted from [Software Carpentry](http://swcarpentry.github.io )
Copyright © Software Carpentry under [CC-BY](https://creativecommons.org/licenses/by/4.0/ )
