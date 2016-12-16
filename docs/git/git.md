# Intro to `git`

## Why version control?

![](./phdcomics.1531.png)

## Initial configuration

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
```bash
$ mkdir wordcount
```

```bash
$ cd wordcount/
```

Now we can use `wget` to download a Python script into the `wordcount` folder.

```bash
$ wget ...
```


```bash
$ ls
```
```bash
word_count.py
```

Now we tell `git` to make `wordcount` a repository--a place where `git` can
store versions of our files:

```bash
$ git init
```
```bash
Initialized empty Git repository in /home/gil/wordcount/.git/
```

If we use `ls` to check the directory's contents, it appears that nothing has
changed:
```bash
$ ls
```
```bash
word_count.py
```

But if we add the `-a` flag to show everything, we can see that `git` has
created a hidden directory called `.git`
```bash
$ ls -a
```
```bash
.  ..  .git  word_count.py
```

This folder contains the entire history of the repository. This means that you
can move the repository around on your computer simply by moving the folder. It
also means that if you delete the `.git` folder, your history is gone.

## `git status`

This is the most used command in `git`.  Let's try it out!

```bash
$ git status
```


```diff
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
```bash
$ git add word_count.py
```

Did anything happen? Let's check! What command should we use?
```bash
$ git status
```


```diff
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

```bash
$ git commit
```

This command will open up your text editor (`nano`) with the following text.

```diff

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

```diff
[master (root-commit) 47f748f] Add initial version of word count script
 1 file changed, 9 insertions(+)
 create mode 100644 word_count.py
```

Great! We have created a snapshot of our file in the repo history. Now, even if
we make changes, we'll be able to roll them back if we don't like them.

You might be wondering what is a "good commit" message. We encourage you to go
to this [link](http://chris.beams.io/posts/git-commit/) and read about why good
commit messages matter and how to write them. 

Did we miss anything? Check `git status` to find out the state of the repository
now.

```bash 
$ git status 
``` 

```diff 
On branch master nothing to commit, working tree clean 
```

### Improve the script

How does the script work right now? Let's run it and find out.

```bash
$ python word_count.py 
```

```bash
{'not': 1, 'but': 1, 'because': 2, 'the': 1, 'was': 1, 'others': 1, 'happy': 4, 
'I': 5, 'really': 1, 'knew': 1, 'feel': 1, 'and': 1, 'felt': 1, 'should': 1, 
'saw': 1, 'were': 1}
```

Ok. This would be more useful if the user could decide what to input, don't you
think? Edit `word_count.py` and make it accept user input instead of a hardcoded
sentence.

```bash
$ nano word_count.py 
```

With those changes saved, let's first see if the script works as expected!

```bash
$ python word_count.py 
I can't quite tell if this is working.  Is it working?
```
```bash
{'tell': 1, 'is': 1, 'working.': 1, 'if': 1, 'working?': 1, "can't": 1,
 'quite': 1, 'Is': 1, 'it': 1, 'I': 1, 'this': 1}
```

It is working! Time to check in with `git`.

```bash
$ git status
```
```diff
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

```bash
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

```bash
$ git add word_count.py
```

And a quick status check...

```bash
$ git status
```
```diff
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   word_count.py

```

Looks good, let's commit.

```bash
$ git commit
```
```diff
[master 97fba8d] allow user input of statement to word count
 1 file changed, 1 insertion(+), 1 deletion(-)
```

And now the status should be clean.

```bash
$ git status
```

```diff
On branch master
nothing to commit, working tree clean
```

### What does `word_count.py` look like now?

`cat` it and find out!

```bash
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

```bash
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

```bash
$ git status
```
```diff
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   word_count.py

no changes added to commit (use "git add" and/or "git commit -a")
```

Check the `diff`
```bash
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


```bash
$ git add word_count.py
```

One helpful shortcut that `git` offers is the `-m` flag, which allows you to
write your commit message right on the command line. This is great when you are
making small, relatively simple changes.

```bash
$ git commit -m "add helper text to input function"
```
```diff
[master 09633c8] add helper text to input function
 1 file changed, 1 insertion(+), 1 deletion(-)
```

See? No text editor opened, but the commit has been made.

## `git log`

Now that we have a few "snapshots" of `word_count.py` we can take a look at its
history. To do that, we use the `git log` command.

```bash
$ git log
```

```diff
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

```bash
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

```bash
$ git log --oneline
```

```diff
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```

As an example, we will restore `word_count.py` to its original state, before we
made any edits. To do that, we `checkout` to the commit hash of the first commit
and specify the file `word_count.py`

```bash
$ git checkout 47f748 word_count.py 
```
Did it work? Use `cat` to find out:

```bash
$ cat word_count.py 
```
```bash
happy = "I felt happy because I saw the others were happy and because I knew I should feel happy but I was not really happy"

words = happy.split()

counts = {}
for word in words:
    counts[word] = counts.get(word, 0) + 1

print(counts)
```

Now the file, as it exists in the folder `wordcount`, is restored to its
original state. Let's check on the `status`.

```bash
$ git status
```

```diff
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
```diff
09633c8 add helper text to input function
97fba8d allow user input of statement to word count
47f748f Add initial version of word count script
```

```bash 
$ git checkout 09633c8 word_count.py 
```

```bash
$ git status
```
```diff
On branch master
nothing to commit, working tree clean
```

And we're back to the future!
