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

This folder contains the entire history of the repository. This means that you
can move the repository around on your computer simply by moving the folder. It
also means that if you delete the `.git` folder, your history is gone.


### Making commits
`add`, `status`, `init`, `commit`

#### `git status`

This is the most used command in `git`.  Let's try it out!

```console
git status
```

```console
$ git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

What is `git` telling us? Quite a bit! We're `On branch master`. We'll ignore
that for now and come back to it later on.

We are on the `Initial commit`. What's a commit? A commit is a granular change
made to a file (or set of files) that is logged in the history of the
repository.

There is `nothing to commit`. That makes sense. There are no files in this
repository and we haven't made any changes.

`(create/copy files and use "git add" to track)`. This we can work with. We need
to create a file in this directory (or copy one) and then start to `track` it.

#### Create a file 

Use `nano` to create something...

Now that there's a file in the repository, let's take another look at `git
status` and see what it reports.

```console
git status
```

```console
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	script.py

nothing added to commit but untracked files present (use "git add" to track)

```

Ok, again we see that `git` is providing us with a bunch of information. The
main point here (and helpfully highlighted in red!) is that there is a new
"Untracked" file in the repo.

#### `git add`

Now that we have a file in the new repo we want to start tracking any changes
made to that file. `git` ignores files until you tell it to look after them. To
begin tracking, we have to `add` the file to the repository:

```console
git add script.py
```

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
