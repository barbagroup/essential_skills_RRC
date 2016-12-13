# Intro to `git` and GitHub

## Why version control?

![](./phdcomics.1531.png)

## Initial configuration

`git config` to set editor, colors, email, name, etc... (use `nano`)

### User settings

The first time we use `git` on a new computer we need to configure a few details.
We want `git` to know who we are and how to reach us (we'll see why later!).

We're also going to specify a text editor to use with `git` and we want git
output to be colorized.

```bash
$ git config --global user.name "Gil Forsyth"
$ git config --global user.email "gilforsyth@gmail.com"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano -w"
```

## Create

Let's create a directory for our work and then move into that directory
```console
$ mkdir wordcount
```


```console
$ cd wordcount/
```


```console
$ wget ...
```



```console
$ ls
```
```console
word_count.py
```

Now we tell `git` to make `wordcount` a repository--a place where `git` can
store versions of our files:

```console
$ git init
```
```console
Initialized empty Git repository in /home/gil/wordcount/.git/
```

If we use `ls` to check the directory's contents, it appears that nothing has
changed:
```console
$ ls
```
```console
word_count.py
```

But if we add the `-a` flag to show everything, we can see that `git` has
created a hidden directory called `.git`
```console
$ ls -a
```
```console
.  ..  .git  word_count.py
```

This folder contains the entire history of the repository. This means that you
can move the repository around on your computer simply by moving the folder. It
also means that if you delete the `.git` folder, your history is gone.

## `git status`

This is the most used command in `git`.  Let's try it out!

```console
$ git status
```


```console
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	word_count.py

nothing added to commit but untracked files present (use "git add" to track)
```

What is `git` telling us? Quite a bit! We're `On branch master`. We'll ignore
that for now and come back to it later on.

We are on the `Initial commit`. What's a commit? A commit is a granular change
made to a file (or set of files) that is logged in the history of the
repository.

What about that last line? We can use `git add` to track. Let's try that.

## `git add`
We have a file in the new repo and we want to start tracking any changes
made to that file. `git` ignores files until you tell it to look after them. To
begin tracking, we have to `add` the file to the repository:
```console
$ git add word_count.py
```

Did anything happen? Let's check! What command should we use?
```console
$ git status
```


```console
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   word_count.py

```

Again, let's review the information that `git status` gives us:

* We are still `On branch master` (and still ignoring this)
* It is still the `Initial commit` (which makes sense, we haven't made any
  commits yet...)
* There are `Changes to be committed`

Note that we haven't actually made a commit yet. We haven't finalized the
snapshot of the repo. Right now, we have a file called `word_count.py` located in
what is called the "Staging Area".

The "Staging Area" is where we stage changes. It's a place to gather changes
before committing those changes to the permanent history of the repository.

We'll talk more about the staging area later, but for now, let's finalize the
addition of our new file by creating our first commit!

## `git commit`

It's time!  Let's commit the changes to the repo history.

```console
$ git commit
```

This command will open up your text editor (`nano`) with the following text.

```console

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
#
# Initial commit
#
# Changes to be committed:
#       new file:   word_count.py
#
```
Again, `git` has a bunch of helpful information. We can enter a commit message
on the first line and then save and quit.

```console
[master (root-commit) 47f748f] Add initial version of word count script
 1 file changed, 9 insertions(+)
 create mode 100644 word_count.py
```

Great! We have created a snapshot of our file in the repo history. Now, even if
we make changes, we'll be able to roll them back if we don't like them.

Did we miss anything? Check `git status` to find out the state of the repository
now.

```console 
$ git status 
``` 

```console 
On branch master nothing to commit, working tree clean 
```

### Improve the script

How does the script work right now? Let's run it and find out.

```console
$ python word_count.py 
```

```console
{'not': 1, 'but': 1, 'because': 2, 'the': 1, 'was': 1, 'others': 1, 'happy': 4, 'I': 5, 'really': 1, 'knew': 1, 'feel': 1, 'and': 1, 'felt': 1, 'should': 1, 'saw': 1, 'were': 1}
```

Ok. This would be more useful if the user could decide what to input, don't you
think? Edit `word_count.py` and make it accept user input instead of a hardcoded
sentence.

```console
$ nano word_count.py 
```

With those changes saved, let's first see if the script works as expected!

```console
$ python word_count.py 
I can't quite tell if this is working.  Is it working?
```
```bash
{'tell': 1, 'is': 1, 'working.': 1, 'if': 1, 'working?': 1, "can't": 1, 'quite': 1, 'Is': 1, 'it': 1, 'I': 1, 'this': 1}
```

It is working! Time to check in with `git`.

```console
$ git status
```
```console
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   word_count.py

no changes added to commit (use "git add" and/or "git commit -a")
```

Ok, this is different than before. The first time we added a file, it was "new"
and `git` told us that. Now we have modified an _existing_ file and `git` is
telling us it detected changes made to that file.

Now we know what changes were made since we just made them, but what if we want to check?

## `git diff`

`git diff` examines the _difference_ between the current state of a file and the
last committed version of the file (by default).

```console
$ git diff word_count.py
```
```diff
diff --git a/word_count.py b/word_count.py
index 3326ac7..1ac2be0 100644
--- a/word_count.py
+++ b/word_count.py
@@ -1,4 +1,4 @@
-happy = "I felt happy because I saw the others were happy and because I knew I should feel happy but I was not really happy"
+happy = input()
 
 words = happy.split()
```

Handy! `git` shows which line(s) was changed and colors the replacement text
green and the old text red. This looks ready to go. Time to stage the changes.

```console
$ git add word_count.py
```

And a quick status check...

```console
$ git status
```
```console
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   word_count.py

```

Looks good, let's commit.

```console
$ git commit
```
```console
[master 97fba8d] allow user input of statement to word count
 1 file changed, 1 insertion(+), 1 deletion(-)
```

And now the status should be clean.

```console
$ git status
```

```console
On branch master
nothing to commit, working tree clean
```

### What does `word_count.py` look like now?

`cat` it and find out!

```console
$ cat word_count.py 
```

```python
happy = input()

words = happy.split()

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print(counts)
```

That's the state of the file on the hard drive right now. The most recent change
we've made is what we see.

### `commit` helpers

The blank `input` line might be confusing. Let's add some prompt text to help the user understand what's happening:

```console
$ nano word_count.py 
```

Ok. Changes made, let's test it out.

```bash
$ python word_count.py
Enter a statement to word count: This is a much better user experience
```
```bash
{'This': 1, 'a': 1, 'much': 1, 'is': 1, 'experience': 1, 'user': 1, 'better': 1}
```

Check `status`

```console
$ git status
```
```console
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   word_count.py

no changes added to commit (use "git add" and/or "git commit -a")
```

Check the `diff`
```console
$ git diff
```
```diff
diff --git a/word_count.py b/word_count.py
index 1ac2be0..2689774 100644
--- a/word_count.py
+++ b/word_count.py
@@ -1,4 +1,4 @@
-happy = input()
+happy = input("Enter a statement to word count: ")
 
 words = happy.split()
```
 
If everything looks ok, then stage the file.


```console
$ git add word_count.py
```

One helpful shortcut that `git` offers is the `-m` flag, which allows you to
write your commit message right on the command line. This is great when you are
making small, relatively simple changes.

```console
$ git commit -m "add helper text to input function"
```
```console
[master 09633c8] add helper text to input function
 1 file changed, 1 insertion(+), 1 deletion(-)
```

See? No text editor opened, but the commit has been made.

## `git log`

Now that we have a few "snapshots" of `word_count.py` we can take a look at its
history. To do that, we use the `git log` command.

```console
$ git log
```

```console
commit 09633c88bb3f8b40d1c988b1df9004245320462a
Author: Gil Forsyth <gilforsyth@gmail.com>
Date:   Tue Dec 13 11:01:11 2016 -0500

    add helper text to input function

commit 97fba8ddd7685e650813675f5b024267af0b94e7
Author: Gil Forsyth <gilforsyth@gmail.com>
Date:   Tue Dec 13 10:58:59 2016 -0500

    allow user input of statement to word count

commit 47f748fea14e14ed84452a802dc14a5ea0829949
Author: Gil Forsyth <gilforsyth@gmail.com>
Date:   Tue Dec 13 10:53:23 2016 -0500

    Add initial version of word count script
```

This is the full history of this repository. There are three commits. You can
see the author of each commit, a contact email, the date and time of the change
and the commit message. This is some nice granular information!

Each commit also has a long alphanumeric string for a header line. 
This is the _hash_ of that commit. It is a unique identifier for that particular commit. What can we use the hashes for? Time travel! (sort of...)

## `diff` across time

Remember that `git diff`, by default, shows you the changes made to a specified
file since the most recent commit. You can also ask it to show you changes
between two points in time by specifying the commit hashes to compare.

**Note**: You don't need to type out the _entire_ hash. Just the first 6 characters should do the trick. 

```console
$ git diff 47f748 09633c word_count.py
```

```diff
diff --git a/word_count.py b/word_count.py
index 3326ac7..2689774 100644
--- a/word_count.py
+++ b/word_count.py
@@ -1,4 +1,4 @@
-happy = "I felt happy because I saw the others were happy and because I knew I should feel happy but I was not really happy"
+happy = input("Enter a statement to word count: ")
 
 words = happy.split()
```

That diff is a comparison between the original commit and the most recent commit. 

## `checkout` an older version of a file

`diff` lets us compare the changes made in the repository history, but sometimes
we want to restore a previous version of a file entirely. Maybe we introduced a
mistake somewhere or just like the old way better. People change their minds.

To `checkout` a previous version of a file, we need the commit hashes. We can pass the `--oneline` flag to `git log` for a more compact version:

```console
$ git log --oneline
```

```console
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```

As an example, we will restore `word_count.py` to its original state, before we
made any edits. To do that, we `checkout` to the commit hash of the first commit
and specify the file `word_count.py`

```console
$ git checkout 47f748 word_count.py 
```
Did it work? Use `cat` to find out:

```console
$ cat word_count.py 
```
```console
happy = "I felt happy because I saw the others were happy and because I knew I should feel happy but I was not really happy"

words = happy.split()

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print(counts)
```

Now the file, as it exists in the folder `wordcount`, is restored to its
original state. Let's check on the `status`.

```console
$ git status
```

```console
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   word_count.py
```

This is a little different than what happened before. `git` isn't saying that
changes have been made, it's saying that changes are _staged_. We're just one
`git commit` away from completely restoring `word_count.py`. 

When you restore a file in `git`, rather than eliminating the commits that were
made, `git` creates a _new_ commit that changes everything back. This way, if
you happen to change your mind _again_, you haven't lost anything. Pretty cool,
yeah?

In any case, we don't really want to restore the old version permanently, the new version is much more versatile. Instead of committing the changes, we can put things back the way they were a moment ago, again using `checkout`.

Consult `git log` again and this time, use `checkout` to go to the most recent
commit.

```bash
$ git log --oneline
```
```bash
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```

```console 
$ git checkout 09633c8 word_count.py 
```

```console
$ git status
```
```console
On branch master
nothing to commit, working tree clean
```

And we're back to the future!

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
