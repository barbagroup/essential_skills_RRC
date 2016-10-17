# Intro to `git` and GitHub

## Why version control?

![][./phdcomics.1531.png] 


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

Let's create a directory for our work and then move into that directory

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

Did anything happen? Let's check! What command should we use?

```console
git status
```

```console
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   script.py
```

Again, let's review the information that `git status` gives us:

* We are still `On branch master` (and still ignoring this)
* It is still the `Initial commit` (which makes sense, we haven't made any
  commits yet...)
* There are `Changes to be committed`

Note that we haven't actually made a commit yet. We haven't finalized the
snapshot of the repo. Right now, we have a file called `script.py` located in
what is called the "Staging Area".

The "Staging Area" is where we stage changes. It's a place to gather changes
before committing those changes to the permanent history of the repository.

We'll talk more about the staging area later, but for now, let's finalize the
addition of our new file by creating our first commit!

#### `git commit`

It's time!  Let's commit the changes to the repo history.

```console
git commit
```

This command will open up your text editor (`nano`) with the following text.
Again, `git` has a bunch of helpful information. We can enter a commit message
on the first line and then save and quit.

```console

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
#
# Initial commit
#
# Changes to be committed:
#       new file:   script.py
#
```

You should see something like the following:
  
```console
[master (root-commit) c4aa605] Initial commit - add script.py
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 script.py
``` 

Great! We have created a snapshot of our file in the repo history. Now, even if
we make changes, we'll be able to roll them back if we don't like them.

What does that mean?  Let's make some changes and find out!

### Viewing commits

Before we look at the next set of `git` commands, let's first make some changes
to `script.py`, but don't commit them yet!

#### `git diff`


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
